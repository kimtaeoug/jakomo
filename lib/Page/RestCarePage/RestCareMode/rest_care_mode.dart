import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/Page/RestCarePage/RestCareMode/rest_care_mode_switch.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class RestCareMode extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  RestCareMode({Key? key, required this.supportUI, required this.jakomoColor}):super(key: key);
  late final TextStyle _titleTextStyle = TextStyle(
      fontFamily: supportUI.fontNanum('eb'),
      fontSize: supportUI.resFontSize(16),
      color: jakomoColor.black,
      fontWeight: FontWeight.w800
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.deviceWidth*5/6,
      height: supportUI.resWidth(64),
      decoration: BoxDecoration(
        color: jakomoColor.white,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        border: Border.all(color: jakomoColor.gallery)
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: supportUI.resWidth(24)),
              child: Text('흔들모드', style: _titleTextStyle,),
            ),
            Padding(
              padding: EdgeInsets.only(right: supportUI.resWidth(20)),
              child: RestCareModeSwitch(supportUI: supportUI, jakomoColor: jakomoColor),
            )
          ],
        ),
      ),
    );
  }
}
