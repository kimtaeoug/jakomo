import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_auth_timer_isolate.dart';

class JakomoAuthTimerController extends GetxController{
  RxString time = ''.obs;
  final JakomoAuthTimerIsolate jakomoAuthTimerIsolate = JakomoAuthTimerIsolate();
  void startAuthTimer() => jakomoAuthTimerIsolate.setJakomoTimer();
  void killTimer() => jakomoAuthTimerIsolate.killJakoTimer();
}