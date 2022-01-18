import 'dart:async';

import 'package:get/get.dart';
import 'package:jakomo_recliner/Routes/jakomo_routes.dart';

class MeasureProgressController extends GetxController{
  RxDouble progressValue = 0.0.obs;
  Timer? measureTimer = null;
  void startProgressTimer(){
    int idx = 0;
    Timer.periodic(const Duration(milliseconds: 120), (timer) {
      if(idx == 0){
        measureTimer = timer;
      }
      progressValue.value += 1;
      if(progressValue.value == 1000){
        measureTimer = null;
        Get.toNamed(JakomoRoutes.careResult, arguments: false);
        timer.cancel();
      }
    });
  }
}
