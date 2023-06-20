import 'package:get/get.dart';
import 'package:iupc/constants.dart';
import 'package:iupc/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalState extends GetxController {

  var themeSeed = ColorSeed.baseColor.obs;
  var lightMode = true.obs;
  late SharedPreferences prefs;
  late User user;
  GlobalState() {
    initializeAsync();
    user = User();
  }
  void initializeAsync() async {
    prefs = await SharedPreferences.getInstance();

  }
}
