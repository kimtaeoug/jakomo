import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class IntroController extends GetxController{
  RxInt pageIdx = 0.obs;
  late PageController imgPageController;
  // late PageController textPageController;
  void setImagePageController(PageController input){
    imgPageController = input;
    update();
  }
  // void setTextPageController(PageController input){
  //   textPageController = input;
  //   update();
  // }
  void moveTo(int idx){
    imgPageController.animateToPage(idx, duration: const Duration(milliseconds: 500), curve: Curves.linear);
    // textPageController.animateToPage(idx, duration: const Duration(milliseconds: 600), curve: Curves.linear);
  }
}
