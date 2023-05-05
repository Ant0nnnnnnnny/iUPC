import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(AccountLogic());
    final state = Get.find<AccountLogic>().state;

    return Container();
  }
}
