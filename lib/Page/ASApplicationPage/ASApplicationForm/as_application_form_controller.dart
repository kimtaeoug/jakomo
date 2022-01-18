import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ASApplicationFormController extends GetxController{
  RxList<dynamic> imgList = [].obs;
  RxInt timeIdx = 100.obs;
  RxString selectedDate = ''.obs;
}