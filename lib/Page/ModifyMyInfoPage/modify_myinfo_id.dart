import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class ModifyMyinfoId extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  ModifyMyinfoId(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);
  late final TextStyle _labelTextStyle = TextStyle(
    color: jakomoColor.boulder,
    fontSize: supportUI.resFontSize(10),
    fontFamily: supportUI.fontNanum('r')
  );
  late final TextStyle _valueTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontPoppings('regular'),
      fontWeight: FontWeight.w500
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: supportUI.resHeight(12)),
      child: Container(
        width: supportUI.deviceWidth * 5 / 6,
        height: supportUI.resWidth(56),
        decoration: BoxDecoration(
            color: jakomoColor.alabaster,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: Border.all(color: jakomoColor.gallery)
        ),
        child: Padding(
          padding: EdgeInsets.only(left: supportUI.resWidth(20)),
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: TextFormField(
              style: _valueTextStyle,
              initialValue: 'Kakao_123456789',
              keyboardType: TextInputType.none,
              decoration: InputDecoration(
                labelText: '카카오 아이디',
                labelStyle: _labelTextStyle,
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
    );
  }
}
