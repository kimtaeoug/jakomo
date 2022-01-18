import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/IntroPage/intro_slider_structure.dart';
import 'package:jakomo_recliner/Page/IntroPage/intro_bottom.dart';
import 'package:jakomo_recliner/Page/IntroPage/intro_skip_button.dart';
import 'package:jakomo_recliner/Routes/jakomo_routes.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'intro_controller.dart';
import 'intro_model.dart';

class IntroPage extends StatelessWidget {
  IntroPage({Key? key}) : super(key: key);
  final SupportUI supportUI = SupportUI();
  final JakomoColor jakomoColor = JakomoColor();
  final List<IntroModel> _modelList = [
    IntroModel(
        title: '리클라이너 조작',
        contents: '자코모 앱을 통해 리클라이너 조작이\n자유롭게 가능합니다!',
        img: 'images/splash_recliner_img.png'),
    IntroModel(
        title: '손쉬운 구매와 AS 신청',
        contents: '자코모 앱을 통해 리클라이너 구매와\nAS 신청이 가능합니다!',
        img: 'images/splash_recliner_img2.png'),
    IntroModel(
        title: '손쉬운 구매와 AS 신청',
        contents: '자코모 앱을 통해 리클라이너 구매와\nAS 신청이 가능합니다!',
        img: 'images/splash_recliner_img2.png')
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: jakomoColor.white,
      body: WillPopScope(
        onWillPop: () {
          Get.toNamed(JakomoRoutes.introduction);
          return Future(() => false);
        },
        child: SizedBox(
          width: supportUI.deviceWidth,
          height: supportUI.deviceHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: IntroSkipButton(
                    supportUI: supportUI, jakomoColor: jakomoColor),
              ),
              IntroSliderStructure(
                  supportUI: supportUI,
                  jakomoColor: jakomoColor,
                  modelList: _modelList),
              IntroBottom(
                  supportUI: supportUI,
                  jakomoColor: jakomoColor,
                  listLength: _modelList.length)
            ],
          ),
        ),
      ),
    ));
  }
}
