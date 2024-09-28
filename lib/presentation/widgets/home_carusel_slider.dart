import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../data/model/slider_data.dart';
import '../utility/app_color.dart';
import 'cach_network_image.dart';

class HomeCaruselSlider extends StatefulWidget {
  const HomeCaruselSlider({
    super.key, required this.sliderList,
  });

  final List<SliderData> sliderList;

  @override
  State<HomeCaruselSlider> createState() => _HomeCaruselSliderState();
}

class _HomeCaruselSliderState extends State<HomeCaruselSlider> {
  final ValueNotifier<int> selectIndex=ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 180.0, viewportFraction: 1, onPageChanged: (index, _) {
                selectIndex.value=index;

          }),
          items: widget.sliderList.map((slider) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        CachNetworkImage(url:slider.image ?? '',),
                        Expanded(

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(slider.title ?? ''),
                              Text(slider.shortDes ?? ''),
                            ],
                          ),
                        )
                      ],
                    )

                );
              },
            );
          }).toList(),
        ),
        SizedBox(height: 8,),
        ValueListenableBuilder(
          valueListenable: selectIndex,
          builder: (context, currentPage,_) {
            return  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < widget.sliderList.length; i++)
                  Container(
                    height: 16,
                    width: 16,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: i==currentPage?AppColor.primaryColor:null,
                        border: Border.all(
                          color: Colors.grey,
                        )),
                  )
              ],
            );
          },

        )
      ],
    );
  }
}
