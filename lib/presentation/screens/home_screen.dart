
import 'package:craftproject/data/model/categorityData.dart';
import 'package:craftproject/presentation/screens/email_verifaction.dart';
import 'package:craftproject/presentation/state_holder/bottom_nav_bar.dart';
import 'package:craftproject/presentation/state_holder/category_list_controller.dart';
import 'package:craftproject/presentation/state_holder/home_slider_controller.dart';

import 'package:craftproject/presentation/utility/asset_path.dart';
import 'package:craftproject/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../widgets/appbarREsuable.dart';
import '../widgets/category_item.dart';
import '../widgets/centerd_circular_progress.dart';
import '../widgets/home_carusel_slider.dart';
import '../widgets/section_hearder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchTextController = TextEditingController();
  //final HomeSliderController homeSliderController=Get.find<HomeSliderController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarResuable(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildSearchTextField(),
              SizedBox(
                height: 16,
              ),
              GetBuilder<HomeSliderController>(
                builder: (sliderController) {
                  if(sliderController.inprogress){
                    return CircularProgressIndactor();
                  }
                  return HomeCaruselSlider(sliderList:
                    sliderController.SliderList);
                }
              ),
              SizedBox(height: 16),
              SectionHearder(
                title: 'All Categories',
                ontab: () {
                  Get.find<BottomNavBarController>().selectCategroy();
                },
              ),
              SizedBox(
                height: 8,
              ),
              GetBuilder<CategoryListController>(
                builder: (categoryListController) {
                  if (categoryListController.inprogress){
                    return CircularProgressIndactor();
                  }
                  return buildCategroyListView(categoryListController.categoryList);
                }
              ),
              SizedBox(
                height: 8,
              ),
              SectionHearder(
                title: 'Popular Product',
                ontab: () {},
              ),
              SizedBox(
                height: 8,
              ),
              buildProductListView(),
              SizedBox(height: 16,),
              SectionHearder(
                title: 'New Product',
                ontab: () {},
              ),
              SizedBox(
                height: 8,
              ),
              buildProductListView(),

            ],
          ),
        ),
      ),
    );
  }

  Widget buildCategroyListView(List<Category> categoryList) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        itemCount: categoryList.length,
        shrinkWrap: true,
        primary: false,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategroyItems(category:categoryList[index],);
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 16,
          );
        },
      ),
    );
  }


  Widget buildProductListView() {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        itemCount: 10,
        shrinkWrap: true,
        primary: false,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductCard();
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width:8,
          );
        },
      ),
    );
  }




  Widget _buildSearchTextField() {
    return TextFormField(
      controller: searchTextController,
      decoration: InputDecoration(
        hintText: 'search',
        fillColor: Colors.grey.shade200,
        filled: true,
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  AppBar appBarResuable() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.navAppSvg),
      automaticallyImplyLeading: false,
      actions: [
        IconButtonResuable(
          iconData: Icons.person,
          ontab: () {
            Get.to(EmailVerifaction());
          },
        ),
        IconButtonResuable(
          iconData: Icons.call,
          ontab: () {},
        ),
        IconButtonResuable(
          iconData: Icons.notification_add,
          ontab: () {},
        ),
      ],
    );
  }
}




