import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/MemberShip/LoginPage/login_footer.dart';
import 'package:jakomo_recliner/Page/MemberShip/LoginPage/login_id.dart';
import 'package:jakomo_recliner/Page/MemberShip/LoginPage/login_social.dart';
import 'package:jakomo_recliner/Page/MemberShip/LoginPage/login_top.dart';
import 'package:jakomo_recliner/Routes/jakomo_routes.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'login_auto.dart';
import 'login_button.dart';
import 'login_pwd.dart';

class LoginPage extends StatelessWidget {
  final SupportUI supportUI = SupportUI();
  final JakomoColor jakomoColor = JakomoColor();
  late final CommonUI commonUI = CommonUI(supportUI: supportUI, jakomoColor: jakomoColor);
  LoginPage({Key? key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset : false,
      body: WillPopScope(
        onWillPop: (){
          Get.toNamed(JakomoRoutes.home);
          return Future(() => false);
        },
        child: SizedBox(
          width: supportUI.deviceWidth,
          height: supportUI.deviceHeight,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LoginTop(supportUI: supportUI, jakomoColor: jakomoColor),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: LoginId(supportUI: supportUI, jakomoColor: jakomoColor, commonUI: commonUI,),
                    ),
                    Center(
                      child: LoginPwd(supportUI: supportUI, jakomoColor: jakomoColor, commonUI: commonUI,),
                    ),
                    LoginAuto(supportUI: supportUI, jakomoColor: jakomoColor),
                    LoginButton(supportUI: supportUI, jakomoColor: jakomoColor, commonUI: commonUI,),
                    LoginSocial(supportUI: supportUI, jakomoColor: jakomoColor),
                  ],
                ),
                LoginFooter(supportUI: supportUI, jakomoColor: jakomoColor)
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
