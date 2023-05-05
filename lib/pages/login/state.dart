import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_state.dart';

class LoginState {
  late GlobalKey<FormFieldState> accountKey;
  late GlobalKey<FormFieldState> passwordKey;
  //0: 未发送
  //1: 发送中
  //2: 发送成功
  //3: 发送失败
  var verifyState = 0.obs;
  late ColorScheme colorScheme ;
  LoginState() {
    ///Initialize variables
    accountKey = GlobalKey<FormFieldState>();
    passwordKey = GlobalKey<FormFieldState>();
    colorScheme= ColorScheme.fromSeed(brightness: Get.find<GlobalState>().lightMode.value? Brightness.light:Brightness.dark,
        seedColor: Get.find<GlobalState>().themeSeed.value.color);
  }
}
