import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/MemberShip/FindMemberShip/FindId/find_id_timer_isolate.dart';

class FindIdTimerController extends GetxController{
  RxString time = ''.obs;
  final FindIdTimerIsolate jakomoAuthTimerIsolate = FindIdTimerIsolate();
  void startAuthTimer() => jakomoAuthTimerIsolate.setJakomoTimer();
  void killTimer() => jakomoAuthTimerIsolate.killJakoTimer();
}