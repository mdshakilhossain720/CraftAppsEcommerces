import 'slider_data.dart';

class HomeSliderModel {
  String? msg;
  List<SliderData>? sliderlist;

  HomeSliderModel({this.msg, this.sliderlist});

  HomeSliderModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      sliderlist = <SliderData>[];
      json['data'].forEach((v) {
        sliderlist!.add(new SliderData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.sliderlist != null) {
      data['data'] = this.sliderlist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


