import 'package:craftproject/data/model/network_response.dart';
import 'package:craftproject/data/model/product.dart';
import 'package:craftproject/data/network_caller/network_caller.dart';
import 'package:craftproject/data/uitility/urls_api.dart';
import 'package:get/get.dart';

import '../../data/model/product_list_by_category.dart';

class SpecialProductController extends GetxController {
  bool _Inprogress = false;


  List<Product> _newProductList = [];


  String _newProductErrorMessage = '';


  bool get Inprogrss => _Inprogress;
  List<Product> get newProductList=>_newProductList;



  Future<bool> getSpecialProduct() async {
    bool isSuccess = false;
    _Inprogress = false;
    update();
    final NetWorkResponse response = await NetWorkCaller.getRequest(
        url: Urls.productListByRemark('Special'));
    if (response.isSuccess) {
      _newProductList =
          ProductListByCategory.fromJson(response.responseData).productList ??
              [];
      isSuccess = true;
    } else {
      _newProductErrorMessage = response.errorMessage;
    }
    _Inprogress = false;
    update();
    return false;
  }
}
