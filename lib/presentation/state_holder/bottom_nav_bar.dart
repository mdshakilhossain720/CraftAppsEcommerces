
import 'package:get/get.dart';

class BottomNavBarController extends GetxController{
  int _selectIndex=0;

  int get selectIndex=>_selectIndex;

  void changeIndex(int index){
    _selectIndex=index;
    update();
  }
  void backToHome(){
    changeIndex(0);
  }


}