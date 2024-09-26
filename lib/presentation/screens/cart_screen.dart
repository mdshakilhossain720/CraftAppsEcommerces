import 'package:craftproject/presentation/utility/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../state_holder/bottom_nav_bar.dart';
import '../widgets/cart_page.dart';
import '../widgets/cart_product.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(

      canPop:false,
      onPopInvoked: (_) async {
        Get.find<BottomNavBarController>().backToHome();
      },
      child: Scaffold(
      //  bottomNavigationBar: _buildCheeckOut(),
          appBar: AppBar(
            title: Text('Cart'),
            leading: IconButton(
                onPressed: () {
                  Get.find<BottomNavBarController>().backToHome();
                },
                icon: Icon(Icons.arrow_back_ios)),
          ),

        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context,index){
                return Cartdetail();
              }),
            ),

            _buildCheeckOut(),
          ],
        ),


    ));
  }

  Widget _buildCheeckOut() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.primaryColor.withOpacity(0.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Total Prices",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
              Text(
                "1000",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryColor,
                ),
              )
            ],
          ),
          SizedBox(
              width: 100,
              child: ElevatedButton(onPressed: () {}, child: Text('CheeckOut')))
        ],
      ),
    );
  }
}
