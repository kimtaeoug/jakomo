import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class SignInSocialId extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;
  final TextStyle buttonTextStyle;

  const SignInSocialId(
      {Key? key,
        required this.supportUI,
        required this.jakomoColor,
        required this.commonUI,
        required this.buttonTextStyle,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: supportUI.resHeight(12)),
      child : Container(
        width: supportUI.deviceWidth * 5 / 6,
        height: supportUI.resHeight(56),
        decoration: BoxDecoration(
            color: jakomoColor.wildSand,
            borderRadius:
            const BorderRadius.all(Radius.circular(12)),
            border: Border.all(color:jakomoColor.gallery2)),
        child: Padding(
          padding: EdgeInsets.only(left: supportUI.resWidth(20)),
          child: Center(
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: TextFormField(
                style: TextStyle(
                    color: jakomoColor.boulder,
                    fontSize: supportUI.resFontSize(14),
                    fontFamily: supportUI.fontNanum('r')),
                initialValue: 'Kakao_123456789',
                keyboardType: TextInputType.none,
                decoration: InputDecoration(
                  labelText: '아이디',
                  labelStyle: TextStyle(
                      color: jakomoColor.boulder,
                      fontSize: supportUI.resFontSize(14),
                      fontFamily: supportUI.fontNanum('r')),
                  enabled: false,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}
