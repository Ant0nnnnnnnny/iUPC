import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iupc/pages/login/view.dart';

import 'logic.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(AccountLogic());
    final state = Get.find<AccountLogic>().state;

    return Expanded(child: Center(child: ElevatedButton(onPressed: (){Get.to(LoginPage());}, child: Text('登录'),),));
  }
}
