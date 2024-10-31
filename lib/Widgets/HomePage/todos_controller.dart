import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_app/Widgets/HomePage/todos_model.dart';
import 'package:task_manager_app/Widgets/HomePage/todos_service.dart';
import '../../Components/my_snackbar.dart';
import '../../Service/info.dart';
import '../../Style/strings.dart';

class GetTasksController extends GetxController {
  late RxBool isLoad;
  late GetTasksService service;
  late RxList<TodoResponse> models;
  late String message;
  late bool state;

  @override
  void onInit() async {
    super.onInit();
    isLoad = false.obs;
    service = GetTasksService();
    models = <TodoResponse>[].obs;
    message = '';
    await getData();
  }

  getData({bool isLoadMore = false}) async {
    if (isLoad.value) return;

    if (isLoadMore) {
      isLoad.value = true;
      service.currentPage++;
    } else {
      isLoad.value = true;
    }

    try {
      int skip = service.currentPage * 10;
      var fetchedTasks =
          await service.getTasks( skip: skip);

      if (isLoadMore) {
        print(fetchedTasks.length);
        models.addAll(fetchedTasks);
        // models.assignAll(fetchedTasks);
        print(models.length);
      } else {
        models.addAll(fetchedTasks);
      }
    } finally {
      isLoad.value = false;
    }
  }

  ondelete(int id) async {
    state = await service.deleteData(id);
    if (state) {
      await getData();
      showCustomSnackbar(
        title: '',
        message: deleteMessageSnackBar,
        icon: Icon(Icons.done_all, size: 40),
      );
      print('suii');
    } else {
      print('noop');
    }
  }
}
