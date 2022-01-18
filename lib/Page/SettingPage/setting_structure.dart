import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/Page/SettingPage/setting_alarm.dart';
import 'package:jakomo_recliner/Page/SettingPage/setting_app_version.dart';
import 'package:jakomo_recliner/Page/SettingPage/setting_condition.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class SettingStructure extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  const SettingStructure({Key? key, required this.supportUI, required this.jakomoColor}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: supportUI.deviceWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: SettingAlarm(supportUI: supportUI, jakomoColor: jakomoColor),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: supportUI.resWidth(16), bottom: supportUI.resWidth(35)),
              child: SettingCondition(supportUI: supportUI, jakomoColor: jakomoColor),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: supportUI.resWidth(32), bottom: supportUI.resWidth(25)),
            child: Align(
              alignment: AlignmentDirectional.bottomStart,
              child: SettingAppVersion(supportUI: supportUI, jakomoColor: jakomoColor),
            ),
          )
        ],
      ),
    );
  }
}