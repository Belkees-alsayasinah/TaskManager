import 'dart:convert';
import 'package:task_manager_app/Widgets/HomePage/AddTask/add_task_model.dart';
import '../../../Configurations/server_config.dart';
import '../../../Service/apiService.dart';
import '../../../Service/info.dart';

class AddTaskService {
  var message;

  Future<bool> addTask(AddTaskModel model) async {
    print("UserID: ${model.id}");

    ApiService apiService = ApiService();
    var response = await apiService.postRequest(
      ServerConfig().addTask,
      {
        "todo": model.todo,
        "completed": false,
        "userId": model.id,
      },

    );

    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      print('error');
      message = "Something wrong!";
      return false;
    }
  }
}
