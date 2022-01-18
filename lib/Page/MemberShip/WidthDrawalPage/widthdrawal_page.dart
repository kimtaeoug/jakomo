import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/MemberShip/WidthDrawalPage/widthdrawal_comments.dart';
import 'package:jakomo_recliner/Page/MemberShip/WidthDrawalPage/widthdrawal_contents.dart';
import 'package:jakomo_recliner/Page/MemberShip/WidthDrawalPage/widthdrawal_footer.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class WidthDrawalPage extends StatelessWidget{
  final SupportUI supportUI = SupportUI();
  final JakomoColor jakomoColor = JakomoColor();
  late final CommonUI commonUI = CommonUI(supportUI: supportUI, jakomoColor: jakomoColor);
  WidthDrawalPage({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: jakomoColor.white,
      body: WillPopScope(
        onWillPop: (){
          Get.back();
          return Future(()=>false);
        },
        child: SizedBox(
          width: supportUI.deviceWidth,
          height: supportUI.deviceHeight,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                commonUI.pageTop('회원탈퇴', ''),
                WidthdrawalContents(supportUI: supportUI, jakomoColor: jakomoColor),
                WidthDrawalComments(supportUI: supportUI, jakomoColor: jakomoColor),
                WidthDrawalFooter(supportUI: supportUI, jakomoColor: jakomoColor, commonUI: commonUI)
              ],
            ),
          ),
        ),
      ),
    ));
  }
}