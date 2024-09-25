
import 'package:get/get.dart';

import 'presentation/state_holder/bottom_nav_bar.dart';



class ControllerBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(BottomNavBarController());
  }


}