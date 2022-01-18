import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class BPHistoryBar extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final DateTime date;
  final bool today;
  final int idx;
  final double systolic;
  final double diastolic;
  BPHistoryBar({Key? key,
  required this.supportUI,
    required this.jakomoColor,
    required this.date,
    required this.today,
    required this.idx,
    required this.systolic,
    required this.diastolic
  }):super(key: key);
  late final TextStyle _todayTextStyle = TextStyle(
      color: jakomoColor.yukonGold,
      fontWeight: FontWeight.bold,
      fontSize: supportUI.resFontSize(13),
      fontFamily: supportUI.fontPoppings('semibold'));
  late final TextStyle _notTodayTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontWeight: FontWeight.bold,
      fontSize: supportUI.resFontSize(13),
      fontFamily: supportUI.fontPoppings('semibold'));
  late final TextStyle _noneDataextStyle = TextStyle(
      color: jakomoColor.silver,
      fontWeight: FontWeight.bold,
      fontSize: supportUI.resFontSize(13),
      fontFamily: supportUI.fontPoppings('semibold'));
  late final TextStyle _textStyle = TextStyle(
      fontWeight: FontWeight.w800,
      fontFamily: supportUI.fontPoppings('bold'),
      fontSize: supportUI.resFontSize(10),
      color: jakomoColor.white);
  double height = 0;
  @override
  Widget build(BuildContext context) {
    height = systolic - diastolic;
    return SizedBox(
      width: supportUI.deviceWidth / 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          today?
              Container(
                width: supportUI.deviceWidth/10,
                height: supportUI.resHeight(26.7),
                decoration: const BoxDecoration(
                  image: DecorationImage(image:AssetImage('images/chatballoon.png'),
                  fit:  BoxFit.fill)
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: supportUI.resWidth(2)),
                    child: Text(
                      'Today', style: _textStyle,
                    ),
                  ),
                ),
              ):Container(),
          height == 0?
              Container():
              Padding(
                padding: EdgeInsets.only(bottom: diastolic),
                child: Container(
                  width: supportUI.resWidth(10),
                  height: height < 0? -height:height,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: idx == 7 ? jakomoColor.pistachio : jakomoColor.iron
                  ),
                ),
              ),
          Padding(
            padding: EdgeInsets.only(top: supportUI.resHeight(8)),
            child: Center(
              child: Text(
                date.day.toString(),
                style: _wichTextStyle(height, idx == 7),
              ),
            ),
          )
        ],
      ),
    );
  }
  TextStyle _wichTextStyle(double height, bool _focus){
    TextStyle result = _noneDataextStyle;
    if(height != 0){
      result = _notTodayTextStyle;
    }
    if(_focus){
      result = _todayTextStyle;
    }
    return result;
  }
}
