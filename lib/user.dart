import 'package:iupc/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User{

  late String name;
  late String id;
  late String password;
  late String dormitoryPosition;
  late String airConditionerPosition;
  late bool loginState;

  User(){
    name = '';
    id = '';
    password = '';
    dormitoryPosition = '';
    airConditionerPosition = '';
    loginState = false;
  }
  void loadFromStorage(SharedPreferences prefs){

    name = prefs.getString(StorageKey.userName.value)!;
    id = prefs.getString(StorageKey.userAccount.value)!;
    password = prefs.getString(StorageKey.userPassword.value)!;
    dormitoryPosition = prefs.getString(StorageKey.userDormitoryPosition.value)!;
    name = prefs.getString(StorageKey.userName.value)!;
    airConditionerPosition = prefs.getString(StorageKey.userAirConditionerPosition.value)!;

  }
}