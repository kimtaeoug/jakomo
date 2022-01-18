import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class MeasureProgressGuide extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  MeasureProgressGuide({Key? key, required this.supportUI, required this.jakomoColor}):super(key: key);
  late final TextStyle _guideTextStyle= TextStyle(
    color: jakomoColor.boulder,
    fontFamily: supportUI.fontNanum('r'),
    fontSize: supportUI.resFontSize(12)
  );
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: supportUI.resWidth(15),
          height: supportUI.resHeight(15),
          child: Image.asset('images/lined_info_icon.png', fit: BoxFit.fitHeight,),
        ),
        Padding(
          padding: EdgeInsets.only(left: supportUI.resWidth(7), bottom: supportUI.resHeight(2)),
          child: SizedBox(
            height: supportUI.resHeight(17),
            child: Center(
              child: Text('측정 중일 경우 측정 취소가 어렵습니다', style: _guideTextStyle, textAlign: TextAlign.center,),
            ),
          ),
        )
      ],
    );
  }
}
