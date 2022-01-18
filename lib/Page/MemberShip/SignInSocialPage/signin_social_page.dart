import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/MemberShip/SignInPage/signin_top.dart';
import 'package:jakomo_recliner/Page/MemberShip/SignInSocialPage/signin_social_controller.dart';
import 'package:jakomo_recliner/Page/MemberShip/SignInSocialPage/signin_social_footer.dart';
import 'package:jakomo_recliner/Page/MemberShip/SignInSocialPage/signin_social_structure.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class SignInSocialPage extends StatelessWidget {
  final SupportUI supportUI = SupportUI();
  final JakomoColor jakomoColor = JakomoColor();
  late final CommonUI commonUI =
      CommonUI(supportUI: supportUI, jakomoColor: jakomoColor);

  SignInSocialPage({Key? key}) : super(key: key);
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
                SignInSocialStructure(
                    supportUI: supportUI,
                    jakomoColor: jakomoColor,
                    commonUI: commonUI),
                SignInSocialFooter(
                    supportUI: supportUI,
                    jakomoColor: jakomoColor,
                    commonUI: commonUI)
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
