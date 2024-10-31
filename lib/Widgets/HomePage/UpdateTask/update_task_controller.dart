import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_app/Widgets/HomePage/UpdateTask/update_task_service.dart';
import 'package:task_manager_app/Widgets/HomePage/todos_controller.dart';

import '../../../Components/my_snackbar.dart';
import '../../../constant/strings.dart';

class UpdateTaskController extends GetxController {
  final GetTasksController controller = Get.find();
  late UpdateTaskService service;
  late String message;
  late bool updateState;

  @override
  void onInit() {
    message = '';
    service = UpdateTaskService();
    updateState = false;
    super.onInit();
  }

  void onClickUpdate(bool state, int id) async {
    await updateTask(state, id);
    if (updateState) {
      controller.getData();
      showCustomSnackbar(
        title: '',
        message: updateMessageSnackBar,
        icon: Icon(Icons.done_all, size: 40),
      );
    } else {}
  }

  Future<void> updateTask(bool state, int id) async {
    print(state);
    updateState = await service.updateTask(state, id);
    var mapmsg = service.message;
    if (mapmsg is Map) {
    } else if (mapmsg is String) {
      message = mapmsg;
    }
  }
}
