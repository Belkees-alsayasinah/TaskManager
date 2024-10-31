import 'dart:convert';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:task_manager_app/Widgets/HomePage/todos_model.dart';
import '../../Configurations/server_config.dart';
import '../../Service/apiService.dart';
import 'package:http/http.dart' as http;

class GetTasksService {
  final ApiService apiService = ApiService();
  RxList<TodoResponse> model = <TodoResponse>[].obs;
  int currentPage = 0;

  Future<List<TodoResponse>> getTasks({int limit = 10, int skip = 0}) async {
    String url = '${ServerConfig().getTasks}?limit=$limit&skip=$skip';

    var response = await apiService.getRequest(url);

    if (response.statusCode == 200) {
      var r = json.decode(response.body);
      List<dynamic> tasks = r['todos'];
      model.clear();
      for (var task in tasks) {
        model.add(TodoResponse.fromJson(task));
      }
      return model;
    } else {
      return [];
    }
  }

  Future<bool> deleteData(int id) async {
    String url = ServerConfig().deleteTask;
    final response = await apiService.deleteRequest(url + '$id');

    if (response.statusCode == 200 || response.statusCode == 204) {
      return true;
    }

    print(response.statusCode);
    return false;
  }
}
