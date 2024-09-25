
import 'package:craftproject/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';

import '../widgets/category_item.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.cateGorityName});

  final String cateGorityName;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text(widget.cateGorityName)),
      body: GridView.builder(
          itemCount: 20,
          shrinkWrap: true,
          primary: false,
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio:0.8),
          itemBuilder:(context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 4),
              child: FittedBox(child:ProductCard()),
            );
          }),

    );
  }
}
