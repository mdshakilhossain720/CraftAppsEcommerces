import 'package:flutter/material.dart';

import '../widgets/product_card.dart';


class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WishList'),),
      body: GridView.builder(
        itemCount: 15,
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio: 0.8),
        itemBuilder: (context,index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 4),
            child: FittedBox(child: ProductCard(
              showAddTocard: false,
            )),
          );
        },
      ),


    );
  }
}