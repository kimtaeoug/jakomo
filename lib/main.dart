import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/BLE/ble_controller.dart';
import 'package:jakomo_recliner/Page/BLEControlPage/ble_navigation_controller.dart';
import 'package:jakomo_recliner/Page/BottomNavigation/bottom_navigation_controller.dart';
import 'package:jakomo_recliner/Page/Popup/pop_up_controller.dart';
import 'package:jakomo_recliner/Page/RestCarePage/RestCareAuido/rest_care_audio_controller.dart';
import 'package:jakomo_recliner/Page/SplashPage/splash_page.dart';
import 'package:jakomo_recliner/ServerData/history_controller.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';
import 'JakomoSP/jakomo_sp.dart';
import 'Page/MeasurePage/MeasureProgressPage/measure_progress_controller.dart';
import 'Routes/jakomo_pages.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final SupportUI _supportUI = SupportUI();
  final BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());
  final RestCareAudioController restCareAudioController = Get.put(RestCareAudioController());
  final BLEController bleController = Get.put(BLEController());
  final HistoryController historyController = Get.put(HistoryController());
  final MeasureProgressController measureProgressController = Get.put(MeasureProgressController());
  final PopUpController popUpController = Get.put(PopUpController());
  final JakomoSP jakomoSP = JakomoSP();
  final BLENavigationController bleNavigationController = Get.put(BLENavigationController());
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    _supportUI.deviceWidth = Get.width;
    _supportUI.deviceHeight = Get.height;
    _supportUI.initScreenUtil();
    jakomoSP.initSharedPreference();
    return GetMaterialApp(
      initialRoute: '/',
      routingCallback: (routing){
        if(routing != null){
          bottomNavigationController.currentRoute.value = routing.current;
        }
      },
      getPages: JakomoPages.pages,
      home: SplashPage(),
      debugShowCheckedModeBanner: false,
      supportedLocales: const [
        Locale('ko', 'KO')
      ],
      localizationsDelegates:  const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
    );
  }
}
