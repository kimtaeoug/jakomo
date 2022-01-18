import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'bp_model.dart';

class BPHistoryItem extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final BPModel hrModel;

  BPHistoryItem(
      {Key? key,
        required this.supportUI,
        required this.jakomoColor,
        required this.hrModel})
      : super(key: key);
  late final TextStyle dateTextStyle = TextStyle(
      color: jakomoColor.black,
      fontSize: supportUI.resFontSize(15),
      fontFamily: supportUI.fontPoppings('regular'),
      fontWeight: FontWeight.w400);
  late final TextStyle valueTextStyle = TextStyle(
      color: jakomoColor.black,
      fontSize: supportUI.resFontSize(15),
      fontFamily: supportUI.fontPoppings('semibold'),
      fontWeight: FontWeight.w800);
  late final TextStyle itemTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontSize: supportUI.resFontSize(12),
      fontFamily: supportUI.fontPoppings('semibold'),
      fontWeight: FontWeight.w700);
  late final Size _textSize = supportUI.getTextSize('77', valueTextStyle);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: supportUI.deviceWidth * 5 / 6,
      height: supportUI.resHeight(66),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: supportUI.resHeight(1),
          ),
          SizedBox(
            width: supportUI.deviceWidth * 5 / 6,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    convertDate(hrModel.date),
                    style: dateTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '${hrModel.systolic}/${hrModel.diastolic}',
                        style: valueTextStyle,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: supportUI.resWidth(2)),
                        child: SizedBox(
                          height: _textSize.height-5,
                          child: Align(
                            alignment: AlignmentDirectional.bottomEnd,
                            child: Text(
                              'mmHg',
                              style: itemTextStyle,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            width: supportUI.deviceWidth * 5 / 6,
            height: supportUI.resHeight(1),
            color: jakomoColor.boulder.withOpacity(0.1),
          )
        ],
      ),
    );
  }

  String convertDate(DateTime input) {
    return '${input.year}.${twoDigits(input.month)}.${twoDigits(input.day)} ${twoDigits(input.hour)}:${twoDigits(input.minute)}';
  }

  String twoDigits(int n) => n >= 10 ? '$n' : '0$n';
}
