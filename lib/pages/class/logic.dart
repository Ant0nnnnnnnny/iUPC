import 'package:get/get.dart';

import 'state.dart';

class ClassLogic extends GetxController {
  final ClassState state = ClassState();
  
  void filterPinned(){
    state.pinnedClasses = state.allClasses.where((element) => element.isPinned).toList();
  }
}
