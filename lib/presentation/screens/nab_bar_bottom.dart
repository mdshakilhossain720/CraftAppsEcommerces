
import 'package:craftproject/presentation/screens/home_screen.dart';
import 'package:craftproject/presentation/screens/wish_list.dart';
import 'package:craftproject/presentation/state_holder/category_list_controller.dart';
import 'package:craftproject/presentation/utility/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../state_holder/bottom_nav_bar.dart';
import '../state_holder/home_slider_controller.dart';
import '../state_holder/product_listbye_remark_controller.dart';
import '../widgets/cart_product.dart';
import 'cart_screen.dart';
import 'categority_list.dart';



class BottomNavBar extends StatefulWidget {
  BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  final BottomNavBarController bottomNavBarController=Get.find<BottomNavBarController>();
  List<Widget>screen=[
    HomeScreen(),
    CategorityList(),
    CartScreen(),
    WishList(),


  ];

  final HomeSliderController homeSliderController=Get.find<HomeSliderController>();
  final CategoryListController categoryListController=Get.find<CategoryListController>();
  final  PopularProductController popularProductController=Get.find< PopularProductController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeSliderController.getSliders();
    categoryListController.getCategory();
    popularProductController.getPopularProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BottomNavBarController>(builder: (_){
        return screen[bottomNavBarController.selectIndex];
      }),
      bottomNavigationBar: GetBuilder<BottomNavBarController>(
        builder: (_) {
          return BottomNavigationBar(
              currentIndex: bottomNavBarController.selectIndex,
              onTap: bottomNavBarController.changeIndex,
              selectedItemColor:AppColor.primaryColor,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: true,

              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.dashboard),label: 'Categroy'),
                BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart),label:'Cart'),
                BottomNavigationBarItem(icon: Icon(Icons.favorite_border),label: 'WishList'),

              ]);
        },

      ),

    );
  }
}