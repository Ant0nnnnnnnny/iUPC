import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iupc/utils/html_parser.dart';
import 'package:iupc/utils/http.dart';

import '../../utils/account_encode.dart';
import 'state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();
  void changeVisibility() {
    state.visibility.value = !state.visibility.value;
  }

  void cleanAccountText() {
    state.accountController.clear();
    state.passwordController.clear();
  }

  Future<void> login() async {
    String lt = await HtmlParser.getLt();
    String desWord = (await AccountEncode.encodeAccount(
            state.accountController.value.text,
            state.passwordController.value.text,
            lt))
        .toString();
    debugPrint(desWord);
    Map<String, String> postData = {
      "rsa": desWord,
      "ul": state.accountController.value.text.length.toString(),
      "pl": state.passwordController.value.text.length.toString(),
      "lt": lt,
      "execution":"e2s1",
      "_eventId":"submit"
    };
    String dataStr = "";
    postData.forEach((key, value) {
      dataStr = "$dataStr$key=$value&";
    });
    print(dataStr.substring(0,dataStr.length-1));
    debugPrint((await HttpUtils.loginAffairSys(dataStr.substring(0,dataStr.length-1))).toString());
  }
}
