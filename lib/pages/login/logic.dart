import 'package:get/get.dart';

import '../../utils/account_encode.dart';
import 'state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();
  void changeVisibility() {
    state.visibility.value = !state.visibility.value;
  }

  void cleanAccountText() {
    state.accountController.clear();
  }

  Future<void> login() async {
    // print(AccountEncode.encodeAccount(state.accountController.value.text, state.passwordController.value.text, 'qhtlucifer').toString()
    // );
    Object a = await AccountEncode.encodeAccount('2009050223', 'Antony731065',
        'LT-151535-iocAMs25kSrJbk4XPXKemNdZkHufab-cas');
    print(a.toString());
    print(await AccountEncode.decodeAccount(a.toString()));
  }
}
