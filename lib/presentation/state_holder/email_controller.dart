import 'package:craftproject/data/model/cart_model.dart';
import 'package:craftproject/data/model/categorityData.dart';
import 'package:craftproject/data/model/network_response.dart';
import 'package:craftproject/data/model/slider_data.dart';
import 'package:craftproject/data/network_caller/network_caller.dart';
import 'package:craftproject/data/uitility/urls_api.dart';
import 'package:craftproject/presentation/screens/categority_list.dart';
import 'package:get/get.dart';



class EmailVerifactionController extends GetxController {
  bool _inprogress = false;
  String _errorMessage = '';

  bool get inprogress => _inprogress;

  String get errorMessage => _errorMessage;

  Future<bool> getVerifactionEmail(String email) async {
    bool isSuccess = false;
    _inprogress=true;
    update();

    final NetWorkResponse response =
    await NetWorkCaller.postRequest(url: Urls.emails(email));
    if(response.isSuccess){
      isSuccess=true;


    }
    else{
      _errorMessage=response.errorMessage;

    }
    _inprogress=false;
    update();
    return isSuccess;
  }
}
