import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login/view.dart';
import 'logic.dart';

class ClassPage extends StatelessWidget {
  const ClassPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(ClassLogic());
    final state = Get.find<ClassLogic>().state;

    return  Expanded(
      child: Center(
        child: ElevatedButton(onPressed: () => {
          Get.to(()=>LoginPage())
        }, child: Text('登录')),
      ),
    );
  }
}
