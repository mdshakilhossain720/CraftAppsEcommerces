import 'package:flutter/material.dart';

class IconButtonResuable extends StatelessWidget {
  final IconData iconData;
  final VoidCallback ontab;
  const IconButtonResuable({
    super.key, required this.iconData, required this.ontab,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:4),
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap:ontab,
        child: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.grey.shade200,
          child: Icon(iconData,size: 18,),
        ),
      ),
    );
  }
}