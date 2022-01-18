import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class MyPageInfo extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  MyPageInfo({
    Key? key,
    required this.supportUI,
    required this.jakomoColor,
  }) : super(key: key);
  late final TextStyle _nameTextStyle = TextStyle(
      fontFamily: supportUI.fontNanum('eb'),
      color: jakomoColor.pistachio,
      fontSize: supportUI.resFontSize(24),
      fontWeight: FontWeight.w600
  );
  late final TextStyle _unitTextStyle = TextStyle(
    color: jakomoColor.boulder,
    fontWeight: FontWeight.w300,
    fontSize: supportUI.resFontSize(13),
    fontFamily: supportUI.fontNanum('r')
  );
  late final TextStyle _valueTextStyle = TextStyle(
    color: jakomoColor.black,
    fontFamily: supportUI.fontPoppings('semibold'),
    fontWeight: FontWeight.w600,
    fontSize: supportUI.resFontSize(13)
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: supportUI.commonLeft()),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Text('홍길동', style: _nameTextStyle,),
          ),
          Padding(
            padding: EdgeInsets.only(top: supportUI.resHeight(8), bottom: supportUI.resHeight(7)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: supportUI.resWidth(8)),
                  child: Text('회원번호', style: _unitTextStyle,),
                ),
                Text('12-456', style: _valueTextStyle,)
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(right: supportUI.resWidth(8)),
                child: SizedBox(
                  width: supportUI.getTextSize('회원번호', _unitTextStyle).width,
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text('연락처', style: _unitTextStyle,),
                  ),
                ),
              ),
              Text('010-1234-****', style: _valueTextStyle,)
            ],
          )
        ],
      ),
    );
  }
}