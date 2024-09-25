import 'package:flutter/material.dart';

import '../utility/app_color.dart';

class SectionHearder extends StatelessWidget {
  final String title;
  final VoidCallback ontab;
  const SectionHearder({
    super.key, required this.title, required this.ontab,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,

        ),),
        TextButton(onPressed:ontab, child:Text("See All",style: TextStyle(
          color: AppColor.primaryColor,
        ),))
      ],
    );
  }
}