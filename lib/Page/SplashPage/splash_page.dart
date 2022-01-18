import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/JakomoSP/jakomo_sp.dart';
import 'package:jakomo_recliner/Page/RestCarePage/RestCareAuido/rest_care_audio_factory.dart';
import 'package:jakomo_recliner/Routes/jakomo_routes.dart';
import 'package:jakomo_recliner/ServerData/history_controller.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';
class SplashPage extends StatefulWidget{
  final JakomoColor _jakomoColor = JakomoColor();
  final SupportUI _supportUI = SupportUI();
  final RestCareAudioFactory restCareAudioFactory = RestCareAudioFactory();
  SplashPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _SplashPage();
}
class _SplashPage extends State<SplashPage> {
  late final JakomoColor _jakomoColor = widget._jakomoColor;
  late final SupportUI _supportUI = widget._supportUI;
  late final RestCareAudioFactory restCareAudioFactory = widget.restCareAudioFactory;
  final JakomoSP jakomoSP = JakomoSP();
  final HistoryController historyController = Get.find();
  @override
  void initState() {
    historyController.initHistoryData();
    restCareAudioFactory.initObservingAudioPlayer();
    super.initState();
    bool introSee = false;
    Future.delayed(const Duration(milliseconds: 400)).then((_){
      try{
        introSee = jakomoSP.getIntroSee();
        if(introSee){
          precacheImage(const AssetImage('images/home_background.png'), context);
          Get.offAllNamed(JakomoRoutes.home);
        }else{
          Get.offAllNamed(JakomoRoutes.introduction);
          jakomoSP.introductionSee(true);
        }
      }catch(e){
        Get.offAllNamed(JakomoRoutes.introduction);
        jakomoSP.introductionSee(true);
      }
    });
  }
  @override
  void didChangeDependencies() {
    precacheImage(const AssetImage('images/logo_splash.png'), context);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: _jakomoColor.pistachio,
      body: WillPopScope(
        onWillPop: () => Future(() => false),
        child: Container(),
      ),
    ));
  }
}
