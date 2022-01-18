import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class BLEConnectionGuide extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  BLEConnectionGuide({Key? key, required this.supportUI, required this.jakomoColor}):super(key: key);
  late final TextStyle _guideTextStyle = TextStyle(
    fontFamily: supportUI.fontNanum('b'),
    fontSize: supportUI.resFontSize(12),
    color: jakomoColor.boulder,
    fontWeight: FontWeight.w400
  );
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: supportUI.resWidth(16),
          height: supportUI.resWidth(16),
          child: Image.asset('images/lined_info_icon.png',),
        ),
        Padding(
          padding: EdgeInsets.only(left: supportUI.resWidth(5)),
          child: SizedBox(
            height: supportUI.resWidth(16),
            child: Text('자코모의 리클라이너는 블루투스로 연결됩니다', style: _guideTextStyle,),
          ),
        )
      ],
    );
  }

}