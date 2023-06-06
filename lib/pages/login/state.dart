import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_state.dart';
enum SendingBtnSate {
  normal(0),
  sending(1),
  success(2),
  failed(3);
  const SendingBtnSate(this.value);
  final int value;
}

class LoginState {
  late TextEditingController accountController;
  late TextEditingController passwordController;

   late GlobalKey<FormState> formKey;

  //0: 未发送
  //1: 发送中
  //2: 发送成功
  //3: 发送失败
  var verifyState = SendingBtnSate.normal.obs;
  late ColorScheme colorScheme ;

  late Rx<bool> visibility;
  LoginState() {
    ///Initialize variables
    accountController = TextEditingController();
    passwordController = TextEditingController();

       formKey = GlobalKey<FormState>();
    visibility = false.obs;
    colorScheme= ColorScheme.fromSeed(brightness: Get.find<GlobalState>().lightMode.value? Brightness.light:Brightness.dark,
        seedColor: Get.find<GlobalState>().themeSeed.value.color);
  }
}
