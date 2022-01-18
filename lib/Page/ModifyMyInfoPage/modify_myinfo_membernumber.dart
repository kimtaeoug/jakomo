import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class ModifyMyinfoMembernumber extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;

  ModifyMyinfoMembernumber(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.commonUI})
      : super(key: key);
  late final TextStyle _labelTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontSize: supportUI.resFontSize(10),
      fontFamily: supportUI.fontNanum('r'));
  late final TextStyle _valueTextStyle = TextStyle(
      color: jakomoColor.black,
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontPoppings('regular'));
  late final TextStyle _guideTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontWeight: FontWeight.w400,
      fontSize: supportUI.resFontSize(12),
      fontFamily: supportUI.fontNanum('r'));

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(bottom: supportUI.resWidth(12)),
            child: commonUI.textForm(
                jakomoColor.gallery,
                TextFormField(
                  style: _valueTextStyle,
                  keyboardType: TextInputType.none,
                  initialValue: '123456789',
                  decoration: InputDecoration(
                    enabled: false,
                    labelText: '회원번호',
                    labelStyle: _labelTextStyle,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ))),
        Padding(
          padding: EdgeInsets.only(
              left: supportUI.commonLeft(), bottom: supportUI.resWidth(28)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(right: supportUI.resWidth(6.5)),
                child: SizedBox(
                  width: supportUI.resWidth(15),
                  height: supportUI.resWidth(15),
                  child: Image.asset('images/lined_info_icon.png'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: supportUI.resWidth(2)),
                child: Text(
                  '회원번호 입력시 빠른 서비스 신청이 가능합니다.',
                  style: _guideTextStyle,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: supportUI.resWidth(32)),
          child: Container(
            width: supportUI.deviceWidth * 5 / 6,
            height: supportUI.resHeight(1),
            color: jakomoColor.concrete.withOpacity(0.6),
          ),
        )
      ],
    );
  }
}
