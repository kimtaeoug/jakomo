import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'as_application_form_controller.dart';

class ASApplicationFormCalendar extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;
  ASApplicationFormCalendar(
      {Key? key, required this.supportUI, required this.jakomoColor, required this.commonUI})
      : super(key: key);

  late final TextStyle _titleKrTextStyle = TextStyle(
      color: jakomoColor.mineShaft2,
      fontSize: supportUI.resFontSize(16),
      fontWeight: FontWeight.bold,
      fontFamily: supportUI.fontNanum('eb'));
  late final TextStyle _titleEnTextStyle = TextStyle(
      color: jakomoColor.mineShaft2,
      fontSize: supportUI.resFontSize(16),
      fontWeight: FontWeight.bold,
      fontFamily: supportUI.fontPoppings('semibold'));
  late final TextStyle _guideTextStyle1 = TextStyle(
      color: jakomoColor.boulder,
      fontFamily: supportUI.fontNanum('b'),
      fontSize: supportUI.resFontSize(12));
  late final TextStyle _guideTextStyle2 = TextStyle(
      color: jakomoColor.black,
      fontWeight: FontWeight.w300,
      fontFamily: supportUI.fontNanum('b'),
      fontSize: supportUI.resFontSize(12));
  final ASApplicationFormController applicationFormController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: supportUI.commonLeft()),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: Text.rich(TextSpan(children: [
              TextSpan(text: 'AS ', style: _titleEnTextStyle),
              TextSpan(text: '희망 날짜 선택', style: _titleKrTextStyle)
            ])),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              right: supportUI.commonLeft(),
              bottom: supportUI.resWidth(15),
              top: supportUI.resWidth(14)),
          child: Align(
            alignment: AlignmentDirectional.topEnd,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: supportUI.resWidth(8),
                  height: supportUI.resWidth(8),
                  decoration: BoxDecoration(
                      color: jakomoColor.mercury, shape: BoxShape.circle),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: supportUI.resWidth(6),
                      right: supportUI.resWidth(17)),
                  child: Text(
                    '불가',
                    style: _guideTextStyle1,
                  ),
                ),
                Container(
                  width: supportUI.resWidth(8),
                  height: supportUI.resWidth(8),
                  decoration: BoxDecoration(
                      color: jakomoColor.pistachio, shape: BoxShape.circle),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: supportUI.resWidth(6),
                  ),
                  child: Text(
                    '선택',
                    style: _guideTextStyle2,
                  ),
                ),
              ],
            ),
          ),
        ),
        Center(
          child: commonUI.calendar(),
        )
      ],
    );
  }

}
