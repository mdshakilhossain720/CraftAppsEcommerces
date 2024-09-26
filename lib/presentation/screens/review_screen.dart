
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utility/app_color.dart';
import 'review_show_screen.dart';


class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review',style: TextStyle(
          fontSize: 20,color:AppColor.primaryColor,
        ),),
      ),

      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'First Name',
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Last Name',
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              maxLines: 7,
              decoration: InputDecoration(
                hintText: 'Comment',
              ),
            ),
            SizedBox(height: 20,),

            ElevatedButton(onPressed: (){
              Get.to(()=>ReviewShowScreen());
            }, child: Text('Review')),

          ],
        ),
      ),


    );
  }
}