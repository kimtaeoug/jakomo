//lazyput - > find()할 때 인스턴스 생성
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:jakomo_recliner/Page/ASApplicationPage/ASApplicationForm/as_application_form_controller.dart';
import 'package:jakomo_recliner/Page/BLEControlPage/ble_navigation_controller.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_auth_timer_controller.dart';
import 'package:jakomo_recliner/Page/DirectInquiryPage/InquiryForm/inquiry_form_controller.dart';
import 'package:jakomo_recliner/Page/HomePage/home_page_controller.dart';
import 'package:jakomo_recliner/Page/IntroPage/intro_controller.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureHistory/measure_history_conroller.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureResultPage/measure_result_controller.dart';
import 'package:jakomo_recliner/Page/MemberShip/FindMemberShip/FindId/find_id_controller.dart';
import 'package:jakomo_recliner/Page/MemberShip/FindMemberShip/FindId/find_id_timer_controller.dart';
import 'package:jakomo_recliner/Page/MemberShip/FindMemberShip/FindPwd/find_pwd_controller.dart';
import 'package:jakomo_recliner/Page/MemberShip/FindMemberShip/FindPwd/find_pwd_timer_controller.dart';
import 'package:jakomo_recliner/Page/MemberShip/FindMemberShip/find_membership_controller.dart';
import 'package:jakomo_recliner/Page/MemberShip/LoginPage/login_controller.dart';
import 'package:jakomo_recliner/Page/MemberShip/SignInPage/signin_controller.dart';
import 'package:jakomo_recliner/Page/MemberShip/SignInSocialPage/signin_social_controller.dart';
import 'package:jakomo_recliner/Page/MemberShip/SignInSocialPage/signin_social_timer_controller.dart';
import 'package:jakomo_recliner/Page/ModifyMyInfoPage/modify_controller.dart';
import 'package:jakomo_recliner/Page/RestCarePage/rest_care_navigation_controller.dart';

import 'jakomo_routes.dart';

class JakomoBinding extends Bindings{
  final String name;
  JakomoBinding({required this.name});
  @override
  void dependencies() {
    switch(name){
      case JakomoRoutes.home:
        Get.put(HomePageController());
        Get.put(RestCareNavigationController());
        break;
      case JakomoRoutes.modify:
        Get.put(ModifyController());
        break;
      case JakomoRoutes.login:
        Get.put(LoginController());
        break;
      case JakomoRoutes.asApplication:
        Get.put(ASApplicationFormController());
        break;
      case JakomoRoutes.control:
        break;
      case JakomoRoutes.careHistory:
        Get.put(MeasureHistoryController());
        break;
      case JakomoRoutes.inquiryApplication:
        Get.put(InquiryFormController());
        break;
      case JakomoRoutes.introduction:
        Get.put(IntroController());
        break;
      case JakomoRoutes.signIn:
        Get.put(SigninController());
        Get.put(JakomoAuthTimerController());
        break;
      case JakomoRoutes.signInSocial:
        Get.put(SignInSocialController());
        Get.put(SignInSocialTimerController());
        break;
      case JakomoRoutes.find:
        Get.delete<FindPwdController>();
        Get.put(FindMemberShipController());
        Get.put(FindIdController());
        Get.put(FindIdTimerController());
        Get.put(FindPwdController());
        Get.put(FindPwdTimerController());
        break;
      case JakomoRoutes.careResult:
        Get.put(MeasureResultController());
        break;
    }
  }

}