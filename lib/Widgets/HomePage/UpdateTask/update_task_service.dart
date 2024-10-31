import 'dart:convert';
import 'package:task_manager_app/Widgets/HomePage/AddTask/add_task_model.dart';
import '../../../Configurations/server_config.dart';
import '../../../Service/apiService.dart';
import '../../../Service/info.dart';

class UpdateTaskService {
  var message;

  Future<bool> updateTask(bool state, int id) async {
    ApiService apiService = ApiService();
    var response = await apiService.putRequest(
      ServerConfig().deleteTask + '$id',
      {
        "completed": state,
      },

    );
    print("Body: ${response.body}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('gg');
      return true;
    } else if (response.statusCode == 404) {
      message = "Something wrong!";
      return false;
    } else {
      message = "Something wrong!";
      return false;
    }
  }
}
