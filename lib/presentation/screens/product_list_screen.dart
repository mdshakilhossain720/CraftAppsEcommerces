
import 'package:craftproject/presentation/state_holder/product_by_category_controller.dart';
import 'package:craftproject/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/category_item.dart';
import '../widgets/centerd_circular_progress.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.cateGorityName, required this.categorityId,});

  final String cateGorityName;
  final int categorityId;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<ProductByCategoryListController>().getProductList(widget.categorityId);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text(widget.cateGorityName)),
      body: GetBuilder<ProductByCategoryListController>(
        builder: (productListByController) {
          if(productListByController.inprogress){
            return CircularProgressIndactor();
          }
          return GridView.builder(
              itemCount: productListByController.productList.length,
              shrinkWrap: true,
              primary: false,
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio:0.8),
              itemBuilder:(context,index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 4),
                  child: FittedBox(child:ProductCard(product: productListByController.productList[index],)),
                );
              });
        }
      ),

    );
  }
}
