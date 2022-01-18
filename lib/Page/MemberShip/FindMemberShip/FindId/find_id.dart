import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/MemberShip/FindMemberShip/FindId/find_id_auth_phone.dart';
import 'package:jakomo_recliner/Page/MemberShip/FindMemberShip/FindId/find_id_find_structure.dart';
import 'package:jakomo_recliner/Page/MemberShip/FindMemberShip/FindId/find_id_name.dart';
import 'package:jakomo_recliner/Page/MemberShip/FindMemberShip/FindId/find_id_phone.dart';
import 'package:jakomo_recliner/Page/MemberShip/FindMemberShip/FindId/find_id_result_login_button.dart';
import 'package:jakomo_recliner/Page/MemberShip/FindMemberShip/FindId/find_id_result_structure.dart';
import 'package:jakomo_recliner/Page/MemberShip/FindMemberShip/FindId/find_id_timer_controller.dart';
import 'package:jakomo_recliner/Routes/jakomo_routes.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'find_id_controller.dart';

class FindId extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;

  FindId(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.commonUI})
      : super(key: key);
  final FindIdController findIdController = Get.find();
  final FindIdTimerController findIdTimerController =
      Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: supportUI.resHeight(400),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: supportUI.resHeight(30.5)),
            child: Obx(() {
              if (findIdController.requestFindIdResult.value) {
                return FindIdResultStructure(
                    supportUI: supportUI,
                    jakomoColor: jakomoColor,
                    commonUI: commonUI);
              } else {
                return FindIdFindStructure(
                    supportUI: supportUI,
                    jakomoColor: jakomoColor,
                    commonUI: commonUI);
              }
            }),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: supportUI.resHeight(24)),
            child: Center(
              child: Obx(() {
                RxBool nameCondition = findIdController.didInsertName;
                RxBool authCondition = findIdController.didPhoneAuth;
                if (findIdController.requestFindIdResult.value) {
                  return FindIdResultLoginButton(supportUI: supportUI, jakomoColor: jakomoColor, commonUI: commonUI);
                } else {
                  if (nameCondition.value == true &&
                      authCondition.value == true) {
                    return GestureDetector(
                      onTap: () {
                        findIdController.requestFindIdResult.value = true;
                      },
                      child: commonUI.pistachioBigButton('찾기'),
                    );
                  } else {
                    return commonUI.concreteRectangleButton('찾기');
                  }
                }
              }),
            ),
          )
        ],
      ),
    );
  }
}
