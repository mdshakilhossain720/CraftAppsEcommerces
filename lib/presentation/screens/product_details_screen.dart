
import 'package:craftproject/presentation/utility/app_color.dart';
import 'package:craftproject/presentation/widgets/size_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../widgets/color_picker.dart';
import '../widgets/product_image_slider.dart';
import 'review_screen.dart';



class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int _counterValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductImageSlider(),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Nike shoes is 2024 Editons",
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
                        _buildwrapreview(),
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
                        SizePicker(size:[
                          'M',
                          'L',
                          'Xl',
                          'ML',
                        ], onchange: (String s){}),
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
                        Text(
                            '''simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum
                        
                        '''),
                        SizedBox(height: 5,),



                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          _buildCheeckOut(),
        ],
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

  Widget _buildwrapreview() {
    return Wrap(
      spacing: 10,
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          "\$30",
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