import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/SettingPage/setting_footer.dart';
import 'package:jakomo_recliner/Page/SettingPage/setting_structure.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class SettingPage extends StatelessWidget{
  final JakomoColor jakomoColor = JakomoColor();
  final SupportUI supportUI = SupportUI();
  SettingPage({Key? key}) : super(key: key);
  late final CommonUI commonUI = CommonUI(supportUI: supportUI, jakomoColor: jakomoColor);
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: supportUI.resWidth(36)),
                  child: commonUI.pageTop('앱 설정', ''),
                ),
                SettingStructure(supportUI: supportUI, jakomoColor: jakomoColor),
                SettingFooter(supportUI: supportUI, jakomoColor: jakomoColor)
              ],
            ),
          ),
        ),
      ),
    ));
  }
}