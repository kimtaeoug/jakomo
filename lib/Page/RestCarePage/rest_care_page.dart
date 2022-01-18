import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/BottomNavigation/navigation_with_floating.dart';
import 'package:jakomo_recliner/Page/RestCarePage/rest_care_navigation_controller.dart';
import 'package:jakomo_recliner/Page/RestCarePage/rest_care_scoll.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class RestCarePage extends StatelessWidget {
  RestCarePage({Key? key}) : super(key: key);
  final SupportUI supportUI = SupportUI();
  final JakomoColor jakomoColor = JakomoColor();
  final RestCareNavigationController restCareNavigationController =
    Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: jakomoColor.white,
      body: WillPopScope(
        onWillPop: () {
          Get.back();
          return Future(() => false);
        },
        child: SizedBox(
          width: supportUI.deviceWidth,
          height: supportUI.deviceHeight,
          child: Stack(
            children: [
              RestCareScroll(supportUI: supportUI, jakomoColor: jakomoColor),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: NavigationWithFloating(
                    supportUI: supportUI, jakomoColor: jakomoColor),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
