import 'package:get/get.dart';

import 'find_pwd_timer_isolate.dart';

class FindPwdTimerController extends GetxController{
  RxString time = ''.obs;
  final FindPwdTimerIsolate jakomoAuthTimerIsolate = FindPwdTimerIsolate();
  void startAuthTimer() => jakomoAuthTimerIsolate.setJakomoTimer();
  void killTimer() => jakomoAuthTimerIsolate.killJakoTimer();
}