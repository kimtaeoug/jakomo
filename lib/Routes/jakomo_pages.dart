import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:jakomo_recliner/Page/ASApplicationPage/ASApplicationDetail/as_application_detail_page.dart';
import 'package:jakomo_recliner/Page/ASApplicationPage/ASApplicationForm/as_application_form_page.dart';
import 'package:jakomo_recliner/Page/ASApplicationPage/as_application_page.dart';
import 'package:jakomo_recliner/Page/AskedQuestion/asked_question_page.dart';
import 'package:jakomo_recliner/Page/BLEConnectionPage/ble_connection_page.dart';
import 'package:jakomo_recliner/Page/BLEControlPage/ble_control_page.dart';
import 'package:jakomo_recliner/Page/DirectInquiryPage/InquiryDetail/inquiry_detail_page.dart';
import 'package:jakomo_recliner/Page/DirectInquiryPage/InquiryForm/inquiry_form_page.dart';
import 'package:jakomo_recliner/Page/DirectInquiryPage/inquiry_page.dart';
import 'package:jakomo_recliner/Page/HomePage/home_page.dart';
import 'package:jakomo_recliner/Page/IntroPage/intro_page.dart';
import 'package:jakomo_recliner/Page/JakomoWebview/jakomo_webview.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureBPHistory/bp_history_page.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureHeartRateHistory/hr_history_page.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureHistory/measure_history_page.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureProgressPage/measure_progress_page.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureResultPage/measure_result_page.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureStressHistory/st_history_page.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureWeightHistory/we_history_page.dart';
import 'package:jakomo_recliner/Page/MeasurePage/measure_page.dart';
import 'package:jakomo_recliner/Page/MemberShip/FindMemberShip/find_membership_page.dart';
import 'package:jakomo_recliner/Page/MemberShip/LoginPage/login_page.dart';
import 'package:jakomo_recliner/Page/MemberShip/SignInPage/signin_page.dart';
import 'package:jakomo_recliner/Page/MemberShip/SignInPage/signin_success_page.dart';
import 'package:jakomo_recliner/Page/MemberShip/SignInSocialPage/signin_social_page.dart';
import 'package:jakomo_recliner/Page/MemberShip/WidthDrawalPage/widthdrawal_page.dart';
import 'package:jakomo_recliner/Page/ModifyMyInfoPage/modify_myinfo_page.dart';
import 'package:jakomo_recliner/Page/MyPage/mypage.dart';
import 'package:jakomo_recliner/Page/MyPage/mypage_ble.dart';
import 'package:jakomo_recliner/Page/NotificationListPage/notification_list_page.dart';
import 'package:jakomo_recliner/Page/RestCarePage/RestGuideItem/rest_guide_item.dart';
import 'package:jakomo_recliner/Page/RestCarePage/rest_care_page.dart';
import 'package:jakomo_recliner/Page/SettingPage/setting_page.dart';
import 'package:jakomo_recliner/Page/SplashPage/splash_page.dart';
import 'package:jakomo_recliner/Page/TermConditionPolicyPage/marketing_policy_page.dart';
import 'package:jakomo_recliner/Page/TermConditionPolicyPage/personal_policy_page.dart';
import 'package:jakomo_recliner/Page/TermConditionPolicyPage/term_condition_policy_page.dart';
import 'package:jakomo_recliner/Routes/jakomo_routes.dart';

import '../ui_test.dart';
import 'jakomo_binding.dart';

class JakomoPages {
  static final pages = [
    GetPage(name: JakomoRoutes.uiTest, page: () => UITest()),
    GetPage(
        name: JakomoRoutes.splash,
        page: () => SplashPage(),
        transitionDuration: Duration.zero),
    GetPage(
        name: JakomoRoutes.introduction,
        page: () => IntroPage(),
        binding: JakomoBinding(name: JakomoRoutes.introduction),
        transitionDuration: Duration.zero),
    GetPage(
        name: JakomoRoutes.home,
        page: () => HomePage(),
        binding: JakomoBinding(name: JakomoRoutes.home),
        transitionDuration: Duration.zero),
    GetPage(name: JakomoRoutes.rest, page: () => RestCarePage(), transitionDuration: Duration.zero),
    GetPage(
        name: JakomoRoutes.restItem,
        page: () => RestGuideItem(),
        transitionDuration: Duration.zero),
    GetPage(
        name: JakomoRoutes.care,
        page: () => MeasurePage(),
        transitionDuration: Duration.zero),
    GetPage(
        name: JakomoRoutes.careProgress,
        page: () => MeasureProgressPage(),
        transitionDuration: Duration.zero),
    GetPage(
        name: JakomoRoutes.careResult,
        binding: JakomoBinding(name: JakomoRoutes.careResult),
        page: () => MeasureResultPage(),
        transitionDuration: Duration.zero),
    GetPage(
        name: JakomoRoutes.careHistory,
        page: () => MeasureHistoryPage(),
        binding: JakomoBinding(name: JakomoRoutes.careHistory),
        transitionDuration: Duration.zero),
    GetPage(
        name: JakomoRoutes.connection,
        page: () => BLEConnectionPage(),
        transitionDuration: Duration.zero),
    GetPage(
        name: JakomoRoutes.control,
        page: () => BLEControlPage(),
        binding: JakomoBinding(name: JakomoRoutes.control),
        transitionDuration: Duration.zero),
    GetPage(
        name: JakomoRoutes.webview,
        page: () => JakomoWebview(),
        transitionDuration: Duration.zero),
    GetPage(
        name: JakomoRoutes.as,
        page: () => ASApplicationPage(),
        transitionDuration: Duration.zero),
    GetPage(
        name: JakomoRoutes.asDetail,
        page: () => ASApplicationDetailPage(),
        transitionDuration: Duration.zero),
    GetPage(
        name: JakomoRoutes.asApplication,
        page: () => ASApplicationFormPage(),
        binding: JakomoBinding(name: JakomoRoutes.asApplication),
        transitionDuration: Duration.zero),
    GetPage(
        name: JakomoRoutes.inquiry,
        page: () => InquiryPage(),
        transitionDuration: Duration.zero),
    GetPage(
        name: JakomoRoutes.inquiryDetail,
        page: () => InquiryDetailPage(),
        transitionDuration: Duration.zero),
    GetPage(
        name: JakomoRoutes.inquiryApplication,
        page: () => InquiryFormPage(),
        binding: JakomoBinding(name: JakomoRoutes.inquiryApplication),
        transitionDuration: Duration.zero),
    GetPage(
        name: JakomoRoutes.askedQuestion,
        page: () => AskedquestionPage(),
        transitionDuration: Duration.zero),
    GetPage(
        name: JakomoRoutes.notification,
        page: () => NotificationListPage(),
        transitionDuration: Duration.zero),
    GetPage(
        name: JakomoRoutes.login,
        page: () => LoginPage(),
        binding: JakomoBinding(name: JakomoRoutes.login),
        transitionDuration: Duration.zero),
    GetPage(
        name: JakomoRoutes.myPage,
        page: () => MyPage(),
        transitionDuration: Duration.zero),
    GetPage(
        name: JakomoRoutes.setting,
        page: () => SettingPage(),
        transitionDuration: Duration.zero),
    GetPage(
        name: JakomoRoutes.term,
        page: () => TermConditionPolicyPage(),
        transitionDuration: Duration.zero),
    GetPage(
        name: JakomoRoutes.modify,
        page: () => ModifyMyinfoPage(),
        binding: JakomoBinding(name: JakomoRoutes.modify),
        transitionDuration: Duration.zero),
    GetPage(
        name: JakomoRoutes.widthDrawal,
        page: () => WidthDrawalPage(),
        transitionDuration: Duration.zero),
    GetPage(
        name: JakomoRoutes.signIn,
        page: () => SignInPage(),
        binding: JakomoBinding(name: JakomoRoutes.signIn),
        transitionDuration: Duration.zero),
    GetPage(
        name: JakomoRoutes.signInSocial,
        page: () => SignInSocialPage(),
        binding: JakomoBinding(name: JakomoRoutes.signInSocial),
        transitionDuration: Duration.zero),
    GetPage(
        name: JakomoRoutes.find,
        page: () => FindMemberShipPage(),
        binding: JakomoBinding(name: JakomoRoutes.find),
        transitionDuration: Duration.zero),
    GetPage(
        name: JakomoRoutes.signinSuccess,
        page: () => SignInSuccess(),
        transitionDuration: Duration.zero),
    GetPage(
        name: JakomoRoutes.mypageBLE,
        page: () => MyPageBLE(),
        transitionDuration: Duration.zero),
    GetPage(
        name: JakomoRoutes.bpHistory,
        page: () => BPHistoryPage(),
        transitionDuration: Duration.zero),
    GetPage(
        name: JakomoRoutes.hrHistory,
        page: () => HRHistoryPage(),
        transitionDuration: Duration.zero),
    GetPage(
        name: JakomoRoutes.stHistory,
        page: () => STHistoryPage(),
        transitionDuration: Duration.zero),
    GetPage(
        name: JakomoRoutes.weHistory,
        page: () => WEHistoryPage(),
        transitionDuration: Duration.zero),
    GetPage(
        name: JakomoRoutes.personal,
        page: () => PersonalPolicyPage(),
        transitionDuration: Duration.zero),
    GetPage(
        name: JakomoRoutes.marketing,
        page: () => MarketingPolicyPage(),
        transitionDuration: Duration.zero),
  ];
}
