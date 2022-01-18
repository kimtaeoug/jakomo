import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class RestCareGuideText extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  RestCareGuideText({Key? key, required this.supportUI, required this.jakomoColor}):super(key: key);
  late final TextStyle _guideTextStyle = TextStyle(
      fontSize: supportUI.resFontSize(12),
      color: jakomoColor.boulder,
      fontWeight: FontWeight.w200,
      height: 1.4,
      fontFamily: supportUI.fontNanum('r'),
  );
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: supportUI.deviceWidth * 5 / 6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: supportUI.getTextSize('흔들', _guideTextStyle).height * 2,
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: SizedBox(
                width: supportUI.resWidth(15),
                child: Image.asset('images/lined_info_icon.png', fit: BoxFit.fitWidth,),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: supportUI.resWidth(5), bottom: supportUI.resWidth(3)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: supportUI.resWidth(3)),
                  child: SizedBox(
                    width: supportUI.deviceWidth*13/18,
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text('흔들 모드 이용시 주변 안전에 유의해주세요.', style: _guideTextStyle, textAlign: TextAlign.start,),
                    ),
                  ),
                ),
                SizedBox(
                  width: supportUI.deviceWidth*13/18,
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text('어지러움이 있을 경우 해당 모드를 지양해주세요.', style: _guideTextStyle, textAlign: TextAlign.start,),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}
