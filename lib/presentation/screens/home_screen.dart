import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftproject/presentation/screens/email_verifaction.dart';
import 'package:craftproject/presentation/utility/app_color.dart';
import 'package:craftproject/presentation/utility/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../widgets/appbarREsuable.dart';
import '../widgets/category_item.dart';
import '../widgets/home_carusel_slider.dart';
import '../widgets/section_hearder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchTextController = TextEditingController();

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
              HomeCaruselSlider(),
              SizedBox(height: 16),
              SectionHearder(
                title: 'All Categories',
                ontab: () {},
              ),
              SizedBox(
                height: 8,
              ),
              buildCategroyListView(),
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
              Card(
                color: Colors.white,
                child: SizedBox(
                  width: 130,
                  child: Column(
                    children: [
                      Container(
                        width: 130,

                        color: AppColor.primaryColor.withOpacity(0.1),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(AssetsPath.shoes),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                         // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Nike Sport Shoe Special 3001 Edition",
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),

                            Wrap(
                              spacing: 10,
                              alignment:WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.center,

                              children: [
                                Text("\$34",style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.primaryColor,
                                ),),
                                //Spacer(),
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Icon(Icons.star,color: Colors.amber,size: 20,),
                                    Text("3.4"),
                                    Card(
                                      color: AppColor.primaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(2),

                                      ),
                                      child: Icon(Icons.favorite_border),
                                    ),
                                  ],
                                ),

                              ],
                            ),



                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCategroyListView() {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        itemCount: 10,
        shrinkWrap: true,
        primary: false,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategroyItems();
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 16,
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
