import 'package:craftproject/data/model/categorityData.dart';
import 'package:craftproject/data/model/network_response.dart';
import 'package:craftproject/data/model/product.dart';
import 'package:craftproject/data/model/slider_data.dart';
import 'package:craftproject/data/network_caller/network_caller.dart';
import 'package:craftproject/data/uitility/urls_api.dart';
import 'package:craftproject/presentation/screens/categority_list.dart';
import 'package:get/get.dart';

import '../../data/model/categority_list_model.dart';
import '../../data/model/product_list_by_category.dart';
import '../../data/model/slider_list_model.dart';

class ProductByCategoryListController extends GetxController {
  bool _inprogress = false;
  String _errorMessage = '';
  List<Product> _productList = [];

  bool get inprogress => _inprogress;

  List<Product> get productList  => _productList;

  String get errorMessage => _errorMessage;

  Future<bool> getProductList(int ) async {
    bool isSuccess = false;
    _inprogress=true;
    update();

    final NetWorkResponse response =
    await NetWorkCaller.getRequest(url: Urls().categoryList);
    if(response.isSuccess){
      _productList=ProductListByCategory.fromJson(response.responseData).productList ?? [];

    }
    else{
      _errorMessage=response.errorMessage;

    }
    _inprogress=false;
    update();
    return isSuccess;
  }
}
