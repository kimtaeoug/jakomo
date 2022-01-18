import 'package:get/get.dart';

class BLENavigationController extends GetxController{
  RxInt pageIdx = 1.obs;
  RxBool heatOn = false.obs;
  RxInt heatLevel = 1.obs;
  RxBool shakeOn = false.obs;
}