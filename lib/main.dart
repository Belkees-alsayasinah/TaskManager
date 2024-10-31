import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'Widgets/HomePage/todos_screen.dart';
import 'Widgets/LoginScreen/login_screen.dart';
import 'Service/store.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> checkIfLoggedIn() async {
    StoreInfo info = StoreInfo();
    String? token = await info.read("token");
    return token != null && token.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: checkIfLoggedIn(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        bool isLoggedIn = snapshot.data ?? false;
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: isLoggedIn ? HomePageUI() : LoginScreen(),
        );
      },
    );
  }
}
