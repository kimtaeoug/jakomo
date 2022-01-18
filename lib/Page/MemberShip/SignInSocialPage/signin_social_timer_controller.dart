import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/MemberShip/SignInSocialPage/signin_social_timer_isolate.dart';

class SignInSocialTimerController extends GetxController{
  RxString time = ''.obs;
  final SignSocialTimerIsolate jakomoAuthTimerIsolate = SignSocialTimerIsolate();
  void startAuthTimer() => jakomoAuthTimerIsolate.setJakomoTimer();
  void killTimer() => jakomoAuthTimerIsolate.killJakoTimer();
}