import 'package:craftproject/data/model/categorityData.dart';
import 'package:craftproject/presentation/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utility/app_color.dart';
import 'cach_network_image.dart';

class CategroyItems extends StatelessWidget {
  const CategroyItems({
    super.key, required this.category,
  });
  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=>ProductListScreen(cateGorityName: category.categoryName ?? '', categorityId: category.id!,));
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColor.primaryColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(16),


            ),
            child: CachNetworkImage(url: category.categoryImg ?? '',height: 30,width: 30,)



          ),
          Text(category.categoryName.toString(),maxLines:1,style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColor.primaryColor,
            letterSpacing: 0.4,
            overflow: TextOverflow.ellipsis,
          ),),

        ],
      ),
    );
  }
}