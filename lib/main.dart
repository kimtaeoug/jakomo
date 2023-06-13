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
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(JakomoApp());
}

class JakomoApp extends StatefulWidget{
  JakomoApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _JakomoApp();
}

class _JakomoApp extends State<JakomoApp> {

  @override
  void initState(){
    _initController();
    super.initState();
    _supportUI.deviceWidth = Get.width;
    _supportUI.deviceHeight = Get.height;
    _supportUI.initScreenUtil();
    jakomoSP.initSharedPreference();
  }

  final SupportUI _supportUI = SupportUI();
  final BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());
  final JakomoSP jakomoSP = JakomoSP();
  @override
  Widget build(BuildContext context) {
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
  void _initController(){
    Get.put(RestCareAudioController());
    Get.put(BLEController());
    Get.put(HistoryController());
    Get.put(MeasureProgressController());
    Get.put(PopUpController());
    Get.put(BLENavigationController());
  }
}
