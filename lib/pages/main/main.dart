import 'package:flutter/material.dart';
import 'package:iupc/pages/login/view.dart';
import 'package:get/get.dart';
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: ElevatedButton(onPressed: () => {
          Get.to(LoginPage())
        }, child: Text('登录')),
      ),
    );
  }
}
