import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/Page/SettingPage/setting_alarm_item.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class SettingAlarm extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  SettingAlarm({Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);

  late final TextStyle _titleTextStyle = TextStyle(
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontNanum('b'),
      color: jakomoColor.boulder,
      fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.deviceWidth * 5 / 6,
      decoration: BoxDecoration(
          color: jakomoColor.white,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(color: jakomoColor.gallery)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: supportUI.resWidth(24),
                top: supportUI.resWidth(24),
                bottom: supportUI.resWidth(10)),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                '알림',
                style: _titleTextStyle,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: supportUI.resWidth(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                  3,
                      (index) => SettingAlarmItem(
                      supportUI: supportUI,
                      jakomoColor: jakomoColor,
                      idx: index + 1)),
            ),
          )
        ],
      ),
    );
  }
}
