
import 'package:get/get.dart';

import 'presentation/state_holder/bottom_nav_bar.dart';
import 'presentation/state_holder/category_list_controller.dart';
import 'presentation/state_holder/home_slider_controller.dart';
import 'presentation/state_holder/product_by_category_controller.dart';



class ControllerBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(BottomNavBarController());
    Get.put(HomeSliderController());
    Get.put(CategoryListController());
    Get.put(ProductByCategoryListController());
  }


}