import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class ModifyMyinfoSocialLogin extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  ModifyMyinfoSocialLogin(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);
  late final TextStyle _textStyle = TextStyle(
      color: jakomoColor.black,
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontNanum('eb'),
      fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: supportUI.resWidth(40), bottom: supportUI.resWidth(32)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: supportUI.resWidth(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: supportUI.commonLeft()),
                  child: SizedBox(
                    height: supportUI.resWidth(48),
                    child: Center(
                      child: Text(
                        '소셜 로그인 연동',
                        style: _textStyle,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: supportUI.commonLeft()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: supportUI.resWidth(48),
                        height: supportUI.resWidth(48),
                        child: Image.asset('images/activate_kakao_login.png'),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: supportUI.resWidth(12)),
                        child: SizedBox(
                          width: supportUI.resWidth(48),
                          height: supportUI.resWidth(48),
                          child:
                          Image.asset('images/activate_facebook_login.png'),
                        ),
                      ),
                      SizedBox(
                        width: supportUI.resWidth(48),
                        height: supportUI.resWidth(48),
                        child: Image.asset('images/activate_apple_login.png'),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Center(
            child: Container(
              width: supportUI.deviceWidth*5/6,
              height: supportUI.resHeight(1),
              color: jakomoColor.concrete2.withOpacity(0.6),
            ),
          )
        ],
      ),
    );
  }
}
