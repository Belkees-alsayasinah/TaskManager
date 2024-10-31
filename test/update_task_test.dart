import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:task_manager_app/Widgets/HomePage/UpdateTask/update_task_service.dart';
import 'package:test/test.dart';
import 'package:task_manager_app/Configurations/server_config.dart';

void main() {
  group('AddTaskService', () {
    late DioAdapter dioAdapter;
    late UpdateTaskService updateTaskService;

    setUp(() {
      final dio = Dio();
      dioAdapter = DioAdapter(dio: dio);
      updateTaskService = UpdateTaskService();
    });

    tearDown(() {
      dioAdapter.close();
    });

    test('should return true when adding a task is successful', () async {
      dioAdapter.onPost(
        ServerConfig().deleteTask,
        (server) => server.reply(200, {'success': true}),
      );

      final result = await updateTaskService.updateTask(true, 1);
      expect(result, true);
    });

    test('should return false when the API returns 404', () async {
      dioAdapter.onPost(
        ServerConfig().addTask,
        (server) => server.reply(400, {"message": "User id is required"}),
      );

      final result = await updateTaskService.updateTask(true, 0);
      expect(result, false);
      expect(updateTaskService.message,
          "Something wrong!");
    });

    test('should return false for other error codes', () async {
      dioAdapter.onPost(
        ServerConfig().addTask,
        (server) => server.reply(500, {'error': 'Internal Server Error'}),
      );

      final result = await updateTaskService.updateTask(true, 0);
      expect(result, false);
    });
  });
}
