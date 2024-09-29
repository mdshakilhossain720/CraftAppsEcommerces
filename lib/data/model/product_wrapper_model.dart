import 'package:craftproject/data/model/product.dart';

import 'product_details_model.dart';

class ProductWrapperModel {
  String? msg;
  List<ProductDetailsModel>? productDetails;

  ProductWrapperModel({this.msg, this.productDetails});

  ProductWrapperModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      productDetails = <ProductDetailsModel>[];
      json['data'].forEach((v) {
        productDetails!.add(new ProductDetailsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.productDetails != null) {
      data['data'] = this.productDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}








