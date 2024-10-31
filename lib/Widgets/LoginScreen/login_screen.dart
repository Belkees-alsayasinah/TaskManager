import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_app/Components/my_button.dart';
import 'package:task_manager_app/Components/my_text_field.dart';
import 'package:task_manager_app/Widgets/LoginScreen/login_controller.dart';

import '../../Style/constant.dart';
import '../../Style/dimensions.dart';
import '../../Style/strings.dart';
import '../../Style/textStyle.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = getScreenWidth(context);
    final double screenHeight = getScreenHeight(context);
    LoginPageController controller = Get.put(LoginPageController());

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          right: getResponsivePadding(context, 0.1),
          left: getResponsivePadding(context, 0.1),
          top: getResponsivePadding(context, 0.06),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: controller.formstate,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: screenWidth * 0.6,
                    width: screenWidth * 0.5,
                    child: Image.asset(logoURL),
                  ),
                  SizedBox(height: 35),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        loginTitle,
                        style: TextStyles.headingStyle,
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      MyTextField(
                        label: '',
                        hint: usernameHint,
                        textInputAction: TextInputAction.next,
                        onsave: (value) {
                          controller.username = value!;
                        },
                        keyboardType: TextInputType.emailAddress,
                        width: screenWidth,
                        height: screenHeight * 0.1,
                        icon: Icons.person,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return validationError;
                          }

                          return null;
                        },
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      MyTextField(
                        label: '',
                        hint: passwordHint,
                        textInputAction: TextInputAction.next,
                        onsave: (value) {
                          controller.password = value!;
                        },
                        keyboardType: TextInputType.visiblePassword,
                        width: screenWidth,
                        height: screenHeight * 0.1,
                        icon: Icons.lock,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return validationError;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      MyButton(
                        onsave: () {
                          if (controller.formstate.currentState!.validate()) {
                            controller.onClickLogin();
                          }
                        },
                        width: screenWidth,
                        height: screenHeight * 0.08,
                        text: loginButtonText,
                        color: buttonColor,
                        textColor: white,
                        radius: 15,
                        fontSize: getFontSize(context, 0.06),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            anotherAccount,
                            style: TextStyles.bodyStyle,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              signUp,
                              style: TextStyles.textButton,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
