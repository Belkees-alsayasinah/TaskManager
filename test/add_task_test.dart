import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:test/test.dart';
import 'package:task_manager_app/Widgets/HomePage/AddTask/add_task_model.dart';
import 'package:task_manager_app/Widgets/HomePage/AddTask/add_task_service.dart';
import 'package:task_manager_app/Configurations/server_config.dart';

void main() {
  group('AddTaskService', () {
    late DioAdapter dioAdapter;
    late AddTaskService addTaskService;

    setUp(() {
      final dio = Dio();
      dioAdapter = DioAdapter(dio: dio);
      addTaskService = AddTaskService();
    });

    tearDown(() {
      dioAdapter.close();
    });

    test('should return true when adding a task is successful', () async {
      dioAdapter.onPost(
        ServerConfig().addTask,
        (server) => server.reply(200, {'success': true}),
      );

      final model = AddTaskModel(todo: 'Test task', id: 1);
      final result = await addTaskService.addTask(model);
      expect(result, true);
    });

    test('should return false when the API returns 404', () async {
      dioAdapter.onPost(
        ServerConfig().addTask,
        (server) => server.reply(400, {"message": "User id is required"}),
      );

      final model = AddTaskModel(todo: 'Test 400', id: null);
      final result = await addTaskService.addTask(model);
      expect(result, false);
      expect(addTaskService.message,
          "Something wrong!"); // يجب أن يتم تعيين الرسالة بشكل صحيح
    });

    test('should return false for other error codes', () async {
      dioAdapter.onPost(
        ServerConfig().addTask,
        (server) => server.reply(500, {'error': 'Internal Server Error'}),
      );

      final model = AddTaskModel(todo: 'Test task');
      final result = await addTaskService.addTask(model);
      expect(result, false);
    });
  });
}
