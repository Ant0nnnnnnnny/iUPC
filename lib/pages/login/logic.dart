import 'package:get/get.dart';

import 'state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();
  void changeVisibility(){
    state.visibility.value = !state.visibility.value;
  }
  void cleanAccountText(){
    state.accountController.clear();
  }
}
