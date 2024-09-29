
import 'package:craftproject/presentation/state_holder/product_details_controller.dart';
import 'package:get/get.dart';

import 'presentation/state_holder/add_to_cart_controller.dart';
import 'presentation/state_holder/bottom_nav_bar.dart';
import 'presentation/state_holder/category_list_controller.dart';
import 'presentation/state_holder/email_controller.dart';
import 'presentation/state_holder/home_slider_controller.dart';
import 'presentation/state_holder/new_product_controller.dart';
import 'presentation/state_holder/product_by_category_controller.dart';
import 'presentation/state_holder/product_listbye_remark_controller.dart';
import 'presentation/state_holder/special_product_controller.dart';



class ControllerBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(BottomNavBarController());
    Get.put(HomeSliderController());
    Get.put(CategoryListController());
    Get.put(ProductByCategoryListController());
    Get.put(PopularProductController());

     Get.put(NewProductController ());
     Get.put(SpecialProductController());
     Get.put(ProductDetailsController());
     Get.put(AddToCartController());
     Get.put(EmailVerifactionController());
  }


}