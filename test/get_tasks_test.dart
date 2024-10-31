import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:task_manager_app/Widgets/HomePage/todos_service.dart';
import 'package:test/test.dart';
import 'package:task_manager_app/Configurations/server_config.dart';
import 'package:task_manager_app/Widgets/HomePage/todos_model.dart';

void main() {
  group('GetTasksService', () {
    late Dio dio;
    late DioAdapter dioAdapter;
    late GetTasksService getTasksService;

    setUp(() {
      dio = Dio();
      dioAdapter = DioAdapter(dio: dio);
      getTasksService = GetTasksService();
    });

    tearDown(() {
      dioAdapter.close();
    });

    test('should return list of tasks when fetching tasks is successful',
        () async {
      dioAdapter.onGet(
        '${ServerConfig().getTasks}?limit=10&skip=0',
        (server) => server.reply(200, {
          'todos': [
            {'id': 1, 'todo': 'Test Task 1', 'completed': false},
            {'id': 2, 'todo': 'Test Task 2', 'completed': true},
          ]
        }),
      );

      final result = await getTasksService.getTasks();
      expect(result.length, 10);
      expect(result[0].todo, 'Do something nice for someone you care about');
      print(result);
      expect(result[1].completed, true);
    });

    test('should return empty list when the API returns 404', () async {
      dioAdapter.onGet(
        '${ServerConfig().getTasks}?limit=10&skip=0',
        (server) => server.reply(404, {'message': 'Not Found'}),
      );

      final result = await getTasksService.getTasks(limit: 2000, skip: 2000);
      print(result);
      expect(result.isEmpty, true);
    });

    test('should return empty list for other error codes', () async {
      dioAdapter.onGet(
        '${ServerConfig().getTasks}?limit=10&skip=0',
        (server) => server.reply(500, {'error': 'Internal Server Error'}),
      );

      final result = await getTasksService.getTasks(limit: 20000, skip: 200000);
      print(result);
      expect(result.isEmpty, true);
    });
  });
}
