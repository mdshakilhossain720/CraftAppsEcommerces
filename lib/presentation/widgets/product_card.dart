import 'package:craftproject/data/model/product.dart';
import 'package:craftproject/presentation/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utility/app_color.dart';
import '../utility/asset_path.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({this.showAddTocard = true, super.key, required this.product});

  final bool showAddTocard;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(ProductDetails(productId:product.id!));
      },
      child: Card(
        elevation: 3,
        surfaceTintColor: Colors.white,
        color: Colors.white,
        child: SizedBox(
          width: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 130,
                color: AppColor.primaryColor.withOpacity(0.1),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(AssetsPath.shoes),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      product.title ?? " ",
                      // textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Wrap(
                      spacing: 10,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          "\$${product.price}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColor.primaryColor,
                          ),
                        ),
                        //Spacer(),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20,
                            ),
                            Text('${product.star}'),
                            _buildAddToShowButton(),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddToShowButton() {
    return Visibility(
      visible: showAddTocard,
      replacement: Card(
        color: AppColor.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
        child: Icon(Icons.delete),
      ),
      child: Card(
        color: AppColor.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
        child: Icon(Icons.favorite_border),
      ),
    );
  }
}
