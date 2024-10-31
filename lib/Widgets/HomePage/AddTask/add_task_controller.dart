import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_app/Service/info.dart';
import 'package:task_manager_app/Widgets/HomePage/AddTask/add_task_model.dart';
import 'package:task_manager_app/Widgets/HomePage/AddTask/add_task_service.dart';
import '../../../Components/my_snackbar.dart';
import '../../../constant/strings.dart';

class AddTaskController extends GetxController {
  late String todo;
  late AddTaskService service;
  late String message;
  late bool addedState;
  late GlobalKey<FormState> formstate;

  @override
  void onInit() {
    todo = '';
    message = '';
    service = AddTaskService();
    addedState = false;
    formstate = GlobalKey<FormState>();
    super.onInit();
  }

  void onClickAdd() async {
    var formdata = formstate.currentState;
    print(formdata!.validate());
    if (formdata!.validate()) {
      formdata.save();
      print("todo : $todo");
      await addTask();
      if (addedState) {
        Get.back();
        showCustomSnackbar(
          title: '',
          message: addMessageSnackBar,
          icon: Icon(Icons.done_all, size: 40),
        );
        todo = '';
      } else {
        Get.snackbar(
          "",
          "There was an error adding the task",
          icon: Icon(Icons.report_gmailerrorred, size: 40),
          duration: Duration(seconds: 5),
          snackPosition: SnackPosition.TOP,
        );
      }
    }
  }

  Future<void> addTask() async {
    AddTaskModel task = AddTaskModel(todo: todo, id: UserInformation.user_id);
    addedState = await service.addTask(task);
    var mapmsg = service.message;
    if (mapmsg is Map) {
    } else if (mapmsg is String) {
      message = mapmsg;
    }
  }
}
