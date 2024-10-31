

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:task_manager_app/Widgets/HomePage/UpdateTask/update_task_controller.dart';

import '../constant/colors.dart';
import '../constant/dimensions.dart';
import '../constant/strings.dart';
import '../constant/textStyle.dart';

class TaskItem extends StatelessWidget {
  final int id;
  final String todo;
  final bool completed;
  final Color taskColor;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const TaskItem({
    Key? key,
    required this.id,
    required this.todo,
    required this.completed,
    required this.taskColor,
    required this.onDelete,
    required this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = getScreenHeight(context);
    final double screenWidth = getScreenWidth(context);
    UpdateTaskController controller = Get.put(UpdateTaskController());

    return Center(
      child: Container(
        height: screenHeight * 0.22,
        width: screenWidth * 0.9,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: taskColor,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            Positioned(
              left: screenWidth * 0.03,
              right: screenWidth * 0,
              child: Container(
                height: screenHeight * 0.22,
                width: screenWidth * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        todo,
                        maxLines: 2,
                        style: TextStyles.headingStyle2,
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              print("compState : $completed");
                              controller.onClickUpdate(!completed, id);

                            },
                            icon: Icon(
                              completed
                                  ? Icons.done_all
                                  : Icons.dangerous_outlined,
                              color: completed ? green : grey,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.01),
                          Text(
                            completed ? completed0 : incomplete0,
                            style: TextStyles.bodyStyle,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: onDelete,
                            icon: CircleAvatar(
                              child: Icon(Icons.delete),
                              radius: screenWidth * 0.04,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
