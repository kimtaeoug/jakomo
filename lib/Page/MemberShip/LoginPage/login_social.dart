import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Routes/jakomo_routes.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class LoginSocial extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  LoginSocial({Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);
  late final TextStyle _socailTextStyle = TextStyle(
      color: jakomoColor.black,
      fontFamily: supportUI.fontNanum('b'),
      fontSize: supportUI.resFontSize(13));

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: supportUI.resWidth(24), bottom: supportUI.resWidth(34)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Text(
                '간편 로그인 & 회원가입',
                style: _socailTextStyle,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: supportUI.resWidth(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(JakomoRoutes.signInSocial);
                    },
                    child: SizedBox(
                      width: supportUI.resWidth(48),
                      height: supportUI.resWidth(48),
                      child: Image.asset('images/activate_kakao_login.png'),
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: supportUI.resWidth(12)),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(JakomoRoutes.signInSocial);
                      },
                      child: SizedBox(
                        width: supportUI.resWidth(48),
                        height: supportUI.resWidth(48),
                        child: Image.asset('images/activate_facebook_login.png'),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(JakomoRoutes.signInSocial);
                    },
                    child: SizedBox(
                      width: supportUI.resWidth(48),
                      height: supportUI.resWidth(48),
                      child: Image.asset('images/activate_apple_login.png'),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
