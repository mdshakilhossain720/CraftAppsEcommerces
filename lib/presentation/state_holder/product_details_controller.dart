import 'package:craftproject/data/model/network_response.dart';
import 'package:craftproject/data/model/product.dart';
import 'package:craftproject/data/model/product_details_model.dart';
import 'package:craftproject/data/network_caller/network_caller.dart';
import 'package:craftproject/data/uitility/urls_api.dart';
import 'package:get/get.dart';

import '../../data/model/product_list_by_category.dart';
import '../../data/model/product_wrapper_model.dart';

class ProductDetailsController extends GetxController {
  bool _Inprogress = false;
  String _errorMessage='';

  ProductDetailsModel  _productDetailsModel=ProductDetailsModel();

  String get errorMessage=>_errorMessage;
  ProductDetailsModel get productDetailModel=>_productDetailsModel;


  bool get ProductDetailsInprogrss => _Inprogress;




  Future<bool> getProductDetails(int productId) async {
    bool isSuccess = false;
    _Inprogress = false;
    update();
    final NetWorkResponse response = await NetWorkCaller.getRequest(
        url: Urls.productListDetails(productId));
    if (response.isSuccess) {
      if(_errorMessage.isNotEmpty){
        _errorMessage ='';

      }
      _productDetailsModel =ProductWrapperModel.fromJson(response.responseData).productDetails!.first;
      isSuccess = true;
    } else {
      _errorMessage  = response.errorMessage;
    }
    _Inprogress = false;
    update();
    return false;
  }
}
