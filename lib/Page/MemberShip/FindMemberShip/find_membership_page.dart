import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/MemberShip/FindMemberShip/FindId/find_id.dart';
import 'package:jakomo_recliner/Page/MemberShip/FindMemberShip/FindPwd/find_pwd.dart';
import 'package:jakomo_recliner/Page/MemberShip/FindMemberShip/find_membership_navigation.dart';
import 'package:jakomo_recliner/Page/MemberShip/FindMemberShip/find_membership_top.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'find_membership_controller.dart';

class FindMemberShipPage extends StatelessWidget {
  final SupportUI supportUI = SupportUI();
  final JakomoColor jakomoColor = JakomoColor();
  late final CommonUI commonUI =
      CommonUI(supportUI: supportUI, jakomoColor: jakomoColor);

  FindMemberShipPage({Key? key}) : super(key: key);
  final FindMemberShipController findMemberShipController = Get.find();

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
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FindMemberShipTop(
                    supportUI: supportUI,
                    jakomoColor: jakomoColor,
                    commonUI: commonUI),
                FindMemberShipNavigation(
                    supportUI: supportUI, jakomoColor: jakomoColor),
                Obx(() {
                  return findMemberShipController.wichIdx.value == 1
                      ? FindId(
                      supportUI: supportUI,
                      jakomoColor: jakomoColor,
                      commonUI: commonUI)
                      : FindPwd(
                      supportUI: supportUI,
                      jakomoColor: jakomoColor,
                      commonUI: commonUI);
                })
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
