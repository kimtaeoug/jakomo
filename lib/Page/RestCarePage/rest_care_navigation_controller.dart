import 'package:get/get.dart';

class RestCareNavigationController extends GetxController{
  // RxInt nowPageIdx = 1.obs;
  RxInt nowPageIdx = 1.obs;
  void setNowPageIdx(int idx){
    nowPageIdx.value = idx;
  }
  RxDouble scrollOffset = 0.0.obs;
  RxDouble widgetSize = 270.0.obs;

  RxDouble guideWidgetSize = 350.0.obs;
}