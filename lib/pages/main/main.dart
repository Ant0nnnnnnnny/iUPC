import 'package:flutter/material.dart';
import 'package:iupc/pages/login/view.dart';
import 'package:get/get.dart';
class MainPage extends StatelessWidget {
  const MainPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: ElevatedButton(onPressed: () => {
          Get.to(()=>LoginPage())
        }, child: Text('登录')),
      ),
    );
  }
}
