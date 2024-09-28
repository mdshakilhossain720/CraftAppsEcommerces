import 'package:craftproject/data/model/network_response.dart';
import 'package:craftproject/data/model/slider_data.dart';
import 'package:craftproject/data/network_caller/network_caller.dart';
import 'package:craftproject/data/uitility/urls_api.dart';
import 'package:get/get.dart';

import '../../data/model/slider_list_model.dart';

class HomeSliderController extends GetxController {
  bool _inprogress = false;
  String _errorMessage = '';
  List<SliderData> _SliderList = [];

  bool get inprogress => _inprogress;

  List<SliderData> get SliderList => _SliderList;

  String get errorMessage => _errorMessage;

  Future<bool> getSliders() async {
    bool isSuccess = false;
    _inprogress=true;
    update();

    final NetWorkResponse response =
        await NetWorkCaller.getRequest(url: Urls().homeSlider);
    if(response.isSuccess){
      _SliderList =HomeSliderModel.fromJson(response.responseData).sliderlist ?? [];
    }
    else{
      _errorMessage=response.errorMessage;

    }
    _inprogress=false;
    update();
    return isSuccess;
  }
}
