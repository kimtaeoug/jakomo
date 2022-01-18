import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/ModifyMyInfoPage/modify_myinfo_authentification.dart';
import 'package:jakomo_recliner/Page/ModifyMyInfoPage/modify_myinfo_footer.dart';
import 'package:jakomo_recliner/Page/ModifyMyInfoPage/modify_myinfo_id.dart';
import 'package:jakomo_recliner/Page/ModifyMyInfoPage/modify_myinfo_image.dart';
import 'package:jakomo_recliner/Page/ModifyMyInfoPage/modify_myinfo_membernumber.dart';
import 'package:jakomo_recliner/Page/ModifyMyInfoPage/modify_myinfo_name.dart';
import 'package:jakomo_recliner/Page/ModifyMyInfoPage/modify_myinfo_not_social.dart';
import 'package:jakomo_recliner/Page/ModifyMyInfoPage/modify_myinfo_phone.dart';
import 'package:jakomo_recliner/Page/ModifyMyInfoPage/modify_myinfo_receive.dart';
import 'package:jakomo_recliner/Page/ModifyMyInfoPage/modify_myinfo_social_login.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'modify_controller.dart';

class ModifyMyinfoPage extends StatelessWidget{
  final SupportUI supportUI = SupportUI();
  final JakomoColor jakomoColor = JakomoColor();
  late final CommonUI commonUI = CommonUI(supportUI: supportUI, jakomoColor: jakomoColor);
  ModifyMyinfoPage({Key? key}):super(key: key);
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
                commonUI.pageTop('회원정보수정',''),
                ModifyMyinfoImage(supportUI: supportUI, jakomoColor: jakomoColor),
                ModifyMyinfoSocialLogin(supportUI: supportUI, jakomoColor: jakomoColor),
                ModifyMyinfoId(supportUI: supportUI, jakomoColor: jakomoColor),
                ModifyMyinfoNotSocial(supportUI: supportUI, jakomoColor: jakomoColor, commonUI: commonUI,),
                ModifyMyinfoPhone(supportUI: supportUI, jakomoColor: jakomoColor, commonUI: commonUI,),
                ModifyMyinfoAuthentification(supportUI: supportUI, jakomoColor: jakomoColor, commonUI: commonUI,),
                ModifyMyinfoName(supportUI: supportUI, jakomoColor: jakomoColor, commonUI: commonUI,),
                ModifyMyinfoMembernumber(supportUI: supportUI, jakomoColor: jakomoColor, commonUI: commonUI,),
                ModifyMyinfoReceive(supportUI: supportUI, jakomoColor: jakomoColor),
                ModifyMyinfoFooter(supportUI: supportUI, jakomoColor: jakomoColor, commonUI: commonUI,)
              ],
            ),
          ),
        ),
      ),
    ));
  }

}