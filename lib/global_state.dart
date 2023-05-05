import 'package:get/get.dart';
import 'package:iupc/constants.dart';

class GlobalState extends GetxController {
  var themeSeed = ColorSeed.baseColor.obs;
  var lightMode = true.obs;
}
