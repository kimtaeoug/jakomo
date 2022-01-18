import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/MemberShip/SignInSocialPage/signin_social_auth_phone.dart';
import 'package:jakomo_recliner/Page/MemberShip/SignInSocialPage/signin_social_email.dart';
import 'package:jakomo_recliner/Page/MemberShip/SignInSocialPage/signin_social_id.dart';
import 'package:jakomo_recliner/Page/MemberShip/SignInSocialPage/signin_social_name.dart';
import 'package:jakomo_recliner/Page/MemberShip/SignInSocialPage/signin_social_phone.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class SignInSocialStructure extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;

  SignInSocialStructure({
    Key? key,
    required this.supportUI,
    required this.jakomoColor,
    required this.commonUI,
  }) : super(key: key);
  late final TextStyle _guideTextStyle = TextStyle(
      color: jakomoColor.black,
      fontWeight: FontWeight.bold,
      fontFamily: supportUI.fontNanum('b'),
      fontSize: supportUI.resFontSize(12));
  late final TextStyle _buttonTextStyle = TextStyle(
      color: jakomoColor.mineShaft,
      fontWeight: FontWeight.bold,
      fontSize: supportUI.resFontSize(10),
      fontFamily: supportUI.fontNanum('b'));
  late final TextStyle _valueTextStyle = TextStyle(
      color: jakomoColor.black,
      fontFamily: supportUI.fontNanum('r'),
      fontSize: supportUI.resFontSize(14));

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              bottom: supportUI.resHeight(16), right: supportUI.commonLeft()),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: supportUI.resWidth(5)),
                child: SizedBox(
                  height: supportUI.getTextSize('필수', _guideTextStyle).height,
                  child: Center(
                    child: Container(
                      width: supportUI.resWidth(4),
                      height: supportUI.resHeight(4),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: jakomoColor.froly),
                    ),
                  ),
                ),
              ),
              Text(
                '필수 입력사항',
                style: _guideTextStyle,
              )
            ],
          ),
        ),
        SignInSocialId(
            supportUI: supportUI,
            jakomoColor: jakomoColor,
            commonUI: commonUI,
            buttonTextStyle: _buttonTextStyle,
        ),
        SignInSocialEmail(
            supportUI: supportUI,
            jakomoColor: jakomoColor,
            commonUI: commonUI,
            buttonTextStyle: _buttonTextStyle,
            valueTextStyle: _valueTextStyle),
        SignInSocialPhone(
            supportUI: supportUI,
            jakomoColor: jakomoColor,
            commonUI: commonUI,
            buttonTextStyle: _buttonTextStyle,
            valueTextStyle: _valueTextStyle),
        SignInSocialAuthPhone(
            supportUI: supportUI,
            jakomoColor: jakomoColor,
            commonUI: commonUI,
            buttonTextStyle: _buttonTextStyle,
            valueTextStyle: _valueTextStyle),
        SignInSocialName(
            supportUI: supportUI,
            jakomoColor: jakomoColor,
            commonUI: commonUI,
            valueTextStyle: _valueTextStyle)
      ],
    );
  }
}
