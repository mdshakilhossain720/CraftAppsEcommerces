import 'package:craftproject/presentation/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utility/app_color.dart';

class CategroyItems extends StatelessWidget {
  const CategroyItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=>ProductListScreen(cateGorityName: 'Electronics'));
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColor.primaryColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(16),


            ),
            child: Icon(Icons.desktop_windows,size: 48,color: AppColor.primaryColor,),



          ),
          Text("Electronics",style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColor.primaryColor,
            letterSpacing: 0.4,
          ),),

        ],
      ),
    );
  }
}