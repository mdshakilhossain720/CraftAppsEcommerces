
import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftproject/presentation/utility/app_color.dart';
import 'package:flutter/material.dart';



class ProductImageSlider extends StatefulWidget {
  const ProductImageSlider({
    super.key,
  });

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  final ValueNotifier<int> selectindex=ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(height: 180.0,viewportFraction: 1,onPageChanged: (index,_){
            selectindex.value=index;

          }),
          items: [1,2,3,4,5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,

                    decoration: BoxDecoration(

                      color: Colors.grey.shade300,
                    ),

                    child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                );
              },
            );
          }).toList(),
        ),
        SizedBox(height: 4,),
        ValueListenableBuilder(
          valueListenable: selectindex,
          builder: (context,currentPage,_){
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(var i=0; i<5;i++)
                  Container(
                    height: 15,
                    width: 15,
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      color: i == currentPage ? AppColor.primaryColor :null,
                      border: Border.all(color: Colors.grey,width: 1),
                      borderRadius: BorderRadius.circular(50),

                    ),
                  )
              ],
            );
          },

        )
      ],
    );
  }
}