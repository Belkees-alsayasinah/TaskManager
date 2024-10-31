import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_app/Components/my_snackbar.dart';
import 'package:task_manager_app/Widgets/HomePage/todos_screen.dart';

import '../../Style/strings.dart';
import 'login_model.dart';
import 'login_service.dart';

class LoginPageController extends GetxController {
  late String username;
  late String password;
  late LoginPageService service;
  late String message;
  late bool loginState;
  late RxBool remember;
  late GlobalKey<FormState> formstate;

  @override
  void onInit() {
    username = '';
    password = '';
    message = '';
    service = LoginPageService();
    loginState = false;
    remember = true.obs;
    formstate = GlobalKey<FormState>();
    super.onInit();
  }

  void onClickLogin() async {
    var formdata = formstate.currentState;
    print(formdata!.validate());
    if (formdata!.validate()) {
      formdata.save();
      print("username : $username");
      print("password : $password");
      await loginClick();
      if (loginState) {
        Get.offAll(() => HomePageUI());
      } else {
        showCustomSnackbar(
          title: loginTitleSnackBar,
          message: loginMessageSnackBar,
          icon: Icon(Icons.report_gmailerrorred, size: 40),
        );
      }
    }
  }

  Future<void> loginClick() async {
    LoginPageModel user =
        LoginPageModel(username: username, password: password);
    loginState = await service.login(user);
    var mapmsg = service.message;
    if (mapmsg is Map) {
    } else if (mapmsg is String) {
      message = mapmsg;
    }
  }
}
