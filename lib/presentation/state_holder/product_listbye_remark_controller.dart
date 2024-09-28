import 'package:craftproject/data/model/network_response.dart';
import 'package:craftproject/data/model/product.dart';
import 'package:craftproject/data/network_caller/network_caller.dart';
import 'package:craftproject/data/uitility/urls_api.dart';
import 'package:get/get.dart';

import '../../data/model/product_list_by_category.dart';

class PopularProductController extends GetxController {
  bool _popularProductInprogress = false;


  List<Product> _popularProductList = [];


  String _popularProductErrorMessage = '';


  bool get popularProductInprogrss => _popularProductInprogress;
  List<Product> get popularProductList=>_popularProductList;



  Future<bool> getPopularProduct() async {
    bool isSuccess = false;
    _popularProductInprogress = false;
    update();
    final NetWorkResponse response = await NetWorkCaller.getRequest(
        url: Urls.productListByRemark('Popular'));
    if (response.isSuccess) {
      _popularProductList =
          ProductListByCategory.fromJson(response.responseData).productList ??
              [];
      isSuccess = true;
    } else {
      _popularProductErrorMessage = response.errorMessage;
    }
    _popularProductInprogress = false;
    update();
    return false;
  }
}
