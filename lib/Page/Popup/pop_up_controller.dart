import 'package:get/get.dart';

class PopUpController extends GetxController{
  RxString title = ''.obs;
  RxString contents = ''.obs;
  RxString bottom = ''.obs;
  RxBool close = false.obs;
}