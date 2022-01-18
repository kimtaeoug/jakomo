import 'package:flutter/material.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class JakomoHistoryBar extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final DateTime date;
  final bool noneData;
  final bool today;
  final bool focus;
  final double height;

  JakomoHistoryBar(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.date,
      required this.noneData,
      required this.today,
      required this.focus,
      required this.height})
      : super(key: key);
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: supportUI.resWidth(49),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          today
              ? Container(
                  width: supportUI.resWidth(49),
                  height: supportUI.resHeight(26.7),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            'images/chatballoon.png',
                          ),
                          fit: BoxFit.fill)),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: supportUI.resWidth(2)),
                      child: Text(
                        'Today',
                        style: _textStyle,
                      ),
                    ),
                  ),
                )
              : Container(),
          noneData
              ? Container()
              : Container(
                  width: supportUI.resWidth(10),
                  height: height,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: focus ? jakomoColor.pistachio : jakomoColor.iron),
                ),
          Center(
            child: Text(
              date.day.toString(),
              style: focus?_notTodayTextStyle:_noneDataextStyle,
            ),
          )
        ],
      ),
    );
  }
}
