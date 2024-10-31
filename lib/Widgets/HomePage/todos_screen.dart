import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_app/Components/task_item.dart';
import 'package:task_manager_app/Widgets/HomePage/todos_controller.dart';
import '../../Components/custom_app_bar.dart';
import '../../constant/colors.dart';
import '../../constant/dimensions.dart';
import '../../constant/strings.dart';
import '../../constant/textStyle.dart';

class HomePageUI extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    GetTasksController controller = Get.put(GetTasksController());
    final double screenWidth = getScreenWidth(context);
    final double screenHeight = getScreenHeight(context);

    _scrollController.addListener(() {
      if (_scrollController.position.atEdge &&
          _scrollController.position.pixels != 0) {
        controller.getData(isLoadMore: true);
      }
    });

    return Scaffold(
      appBar: CustomAppBar(),
      body: Obx(() {
        return controller.isLoad.value
            ? Center(
                child: CircularProgressIndicator(
                  color: buttonColor,
                ),
              )
            : controller.models.isEmpty
                ? Center(
                    child: Text(
                      noTasks,
                      style: TextStyles.headingStyle2,
                    ),
                  )
                : ListView.separated(
                    controller: _scrollController,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final todo = controller.models[index];
                      Color taskColor;
                      switch (index % 4) {
                        case 0:
                          taskColor = tasks1;
                          break;
                        case 1:
                          taskColor = tasks2;
                          break;
                        case 2:
                          taskColor = tasks3;
                          break;
                        case 3:
                        default:
                          taskColor = tasks4;
                          break;
                      }
                      return TaskItem(
                        id: todo.id,
                        todo: todo.todo,
                        completed: todo.completed,
                        taskColor: taskColor,
                        onDelete: () {
                          controller.ondelete(controller.models[index].id);
                        },
                        onEdit: () {},
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    itemCount: controller.models.length,
                  );
      }),
    );
  }
}
