
import 'package:craftproject/data/model/product_details_model.dart';
import 'package:craftproject/presentation/state_holder/product_details_controller.dart';
import 'package:craftproject/presentation/utility/app_color.dart';
import 'package:craftproject/presentation/widgets/size_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../widgets/color_picker.dart';
import '../widgets/product_image_slider.dart';
import 'review_screen.dart';



class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.productId});

  final int productId;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int _counterValue = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<ProductDetailsController>().getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product details'),
      ),
      body: GetBuilder<ProductDetailsController>(
        builder: (productDetailsController) {
          if(productDetailsController.ProductDetailsInprogrss){
            return Center(child: CircularProgressIndicator());
          }
          if(productDetailsController.errorMessage.isNotEmpty){
            return Center(
              child: Text(productDetailsController.errorMessage),
            );
          }
          ProductDetailsModel productDetailsModel=ProductDetailsController().productDetailModel;
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ProductImageSlider(images: [
                        productDetailsModel.img1 ?? '',
                        productDetailsModel.img2 ?? '',
                        productDetailsModel.img3 ?? '',
                        productDetailsModel.img4 ?? '',
                      ],),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  productDetailsModel.product!.title ?? '',
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black45,
                                  ),
                                ),
                                buildItemCount(),
                              ],
                            ),
                            //_buildwrapreview(),
                            Text("Color",style: TextStyle(fontSize: 20,),),
                            SizedBox(height: 5,),
                            ColorPicker(
                              colors: [
                                Colors.black,
                                Colors.green,
                                Colors.blue,
                                Colors.red,
                                Colors.yellow,
                              ],
                              onchange: (Color) {},
                            ),
                            SizedBox(height: 12,),
                            Text("Size"),
                            SizedBox(height: 12,),
                            SizePicker(size: productDetailsModel.size!.split(',')??[], onchange: (String s){}),
                            SizedBox(height: 12,),
                            Text(
                              "Descriptions",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text(productDetailsModel.product!.shortDes ?? ''),
                            SizedBox(height: 5,),
                            Text(productDetailsModel.des ?? ''),



                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              _buildCheeckOut(),
            ],
          );
        }
      ),
    );
  }

  Widget _buildCheeckOut() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color:AppColor.primaryColor.withOpacity(0.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Total Prices",style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),),
              Text("1000",style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor,
              ),)


            ],
          ),
          SizedBox(
              width: 100,
              height: 50,
              child: ElevatedButton(onPressed: (){}, child: FittedBox(child: Text('Add To Cart',style: TextStyle(
                fontSize: 20,
              ),))))
        ],
      ),
    );
  }

  Widget _buildwrapreview(ProductDetailsModel produtcdetails) {
    return Wrap(
      spacing: 10,
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          "\$${produtcdetails.product!.price ?? 0}",
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: AppColor.primaryColor),
        ),
        Wrap(
          children: [
            Icon(
              Icons.star,
              color: Colors.amber,
              size: 20,
            ),
            Text("0.4"),
          ],
        ),
        TextButton(onPressed: () {
          Get.to(()=>ReviewScreen());
        }, child: Text("Reviews")),
        Wrap(
          children: [
            Card(
              color: AppColor.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Icon(Icons.favorite, color: Colors.white),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget buildItemCount() {
    return ItemCount(
      initialValue: _counterValue,
      minValue: 0,
      maxValue: 10,
      decimalPlaces: 0,
      onChanged: (value) {
        _counterValue = value as int;
        setState(() {});
        // Handle counter value changes
        print('Selected value: $value');
      },
    );
  }


}