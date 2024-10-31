import 'dart:convert';
import '../../Configurations/server_config.dart';
import '../../Service/apiService.dart';
import '../../Service/info.dart';
import '../../Service/store.dart';
import 'login_model.dart';
import 'package:http/http.dart' as http;

class LoginPageService {
  var message;
  final http.Client client;

  LoginPageService([http.Client? client]) : client = client ?? http.Client();

  Future<bool> login(LoginPageModel model) async {
    StoreInfo info = StoreInfo();
    await info.save("isLogin", "false");

    ApiService apiService = ApiService(); // تمرير العميل هنا
    var response = await apiService.postRequest(
      ServerConfig().loginApi,
      {
        "username": model.username,
        "password": model.password,
      },
    );

    print("Body: ${response.body}");

    if (response.statusCode == 200 || response.statusCode == 201) {
      var r = jsonDecode(response.body);
      UserInformation.user_token = r['accessToken'];
      UserInformation.user_id = r['id'];
      print("UserID: ${UserInformation.user_id}");
      await info.save("token", UserInformation.user_token);
      return true;
    } else {
      message = "Something wrong!";
      return false;
    }
  }
}
