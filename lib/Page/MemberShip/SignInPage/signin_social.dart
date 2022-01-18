import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/MemberShip/SignInSocialPage/signin_social_page.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class SignInSocial extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  SignInSocial({Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);
  late final TextStyle _textStyle = TextStyle(
      color: jakomoColor.black,
      fontFamily: supportUI.fontNanum('eb'),
      fontSize: supportUI.resFontSize(14));

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: supportUI.commonLeft()),
              child: SizedBox(
                height: supportUI.resHeight(48),
                child: Center(
                  child: Text(
                    '간편 회원가입',
                    style: _textStyle,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: supportUI.commonLeft()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: supportUI.resWidth(12)),
                    child: _socialItem('kakao', context),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: supportUI.resWidth(12)),
                    child: _socialItem('facebook', context),
                  ),
                  _socialItem('apple', context)
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
              top: supportUI.resHeight(23), bottom: supportUI.resHeight(25)),
          child: Center(
            child: Container(
              width: supportUI.deviceWidth * 5 / 6,
              height: supportUI.resHeight(1),
              color: jakomoColor.concrete2,
            ),
          ),
        )
      ],
    );
  }

  Widget _socialItem(String name, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/signin/social');
      },
      child: SizedBox(
        width: supportUI.resWidth(48),
        height: supportUI.resHeight(48),
        child: Image.asset('images/activate_${name}_login.png'),
      ),
    );
  }
}
