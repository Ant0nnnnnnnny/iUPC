import 'package:get/get.dart';
import 'package:iupc/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalState extends GetxController {

  var themeSeed = ColorSeed.baseColor.obs;
  var lightMode = true.obs;
  late SharedPreferences prefs;

  GlobalState() {
    initializeAsync();

  }
  void initializeAsync() async {
    prefs = await SharedPreferences.getInstance();
  }
}
