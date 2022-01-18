import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/Page/BLEConnectionPage/ble_connection_guide.dart';
import 'package:jakomo_recliner/Page/BLEConnectionPage/ble_connection_switch.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class MyPageDevice extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  MyPageDevice({
    Key? key,
    required this.supportUI,
    required this.jakomoColor,
  }) : super(key: key);

  late final TextStyle _titleTextStyle = TextStyle(
      color: jakomoColor.black,
      fontSize: supportUI.resFontSize(16),
      fontFamily: supportUI.fontNanum('eb'),
      fontWeight: FontWeight.w800);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: supportUI.commonLeft()),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              '연결되어 있는 제품',
              style: _titleTextStyle,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: supportUI.resHeight(13), top: supportUI.resHeight(20)),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: BLEConnectionSwitch(
                  supportUI: supportUI, jakomoColor: jakomoColor),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomStart,
            child: BLEConnectionGuide(
                supportUI: supportUI, jakomoColor: jakomoColor),
          )
        ],
      ),
    );
  }
}
