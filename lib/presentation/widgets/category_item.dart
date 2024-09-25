import 'package:flutter/material.dart';

import '../utility/app_color.dart';

class CategroyItems extends StatelessWidget {
  const CategroyItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}