import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/MemberShip/SignInPage/signin_controller.dart';
import 'package:jakomo_recliner/Page/MemberShip/SignInPage/signin_footer.dart';
import 'package:jakomo_recliner/Page/MemberShip/SignInPage/signin_social.dart';
import 'package:jakomo_recliner/Page/MemberShip/SignInPage/signin_structure.dart';
import 'package:jakomo_recliner/Page/MemberShip/SignInPage/signin_top.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class SignInPage extends StatelessWidget {
  final SupportUI supportUI = SupportUI();
  final JakomoColor jakomoColor = JakomoColor();
  late final CommonUI commonUI =
      CommonUI(supportUI: supportUI, jakomoColor: jakomoColor);

  SignInPage({Key? key}) : super(key: key);

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
                SignInTop(
                    supportUI: supportUI,
                    jakomoColor: jakomoColor,
                    commonUI: commonUI),
                SignInSocial(supportUI: supportUI, jakomoColor: jakomoColor),
                SignInStructure(supportUI: supportUI, jakomoColor: jakomoColor, commonUI: commonUI),
                SignInFooter(supportUI: supportUI, jakomoColor: jakomoColor, commonUI: commonUI)
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
