import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_app/Components/my_button.dart';
import 'package:task_manager_app/Style/constant.dart';
import '../../Style/textStyle.dart';
import '../Style/dimensions.dart';
import '../Style/strings.dart';
import '../Widgets/HomePage/AddTask/add_task_controller.dart';
import 'my_text_field.dart';

class AddTaskBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = getScreenWidth(context);
    final double screenHeight = getScreenHeight(context);
    AddTaskController controller = Get.put(AddTaskController());
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        top: getResponsivePadding(context, 0.1),
        left: getResponsivePadding(context, 0.07),
        right: getResponsivePadding(context, 0.07),
      ),
      child: Form(
        key: controller.formstate,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              newTask,
              style: TextStyles.headingStyle,
            ),
            SizedBox(height: screenHeight * 0.02),
            MyTextField(
              label: description,
              hint: '',
              textInputAction: TextInputAction.done,
              onsave: (value) {
                controller.todo = value!;
              },
              keyboardType: TextInputType.text,
              width: screenWidth,
              height: 0,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return validationError;
                }
                return null;
              },
            ),
            SizedBox(height: screenHeight * 0.02),
            MyButton(
                onsave: () {
                  if (controller.formstate.currentState!.validate()) {
                    controller.onClickAdd();
                  }
                },
                width: screenWidth * 0.5,
                height: screenHeight * 0.07,
                text: addTask,
                color: buttonColor,
                textColor: white,
                radius: 15,
                fontSize: getFontSize(context, 0.06)),
            SizedBox(height: screenHeight * 0.02),
          ],
        ),
      ),
    );
  }
}
