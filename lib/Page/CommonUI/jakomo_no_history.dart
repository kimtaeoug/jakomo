import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_pistachio_small_button.dart';
import 'package:jakomo_recliner/Routes/jakomo_routes.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class JakomoNoHistory extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  JakomoNoHistory({Key? key, required this.supportUI, required this.jakomoColor}):super(key: key);

  late final TextStyle _textStyle = TextStyle(
    fontFamily: supportUI.fontNanum('b'),
    fontSize: supportUI.resFontSize(21),
    fontWeight: FontWeight.bold,
    color: jakomoColor.boulder.withOpacity(0.3)
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.deviceWidth,
      height: supportUI.resHeight(184),
      color: jakomoColor.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('측정 내역이 없습니다.', style: _textStyle,),
          ),
          GestureDetector(
            onTap: () => Get.toNamed(JakomoRoutes.care),
            child: Padding(
              padding: EdgeInsets.only(top: supportUI.resHeight(12)),
              child: JakomoPistachioSmallButton(supportUI: supportUI, jakomoColor: jakomoColor, button: '측정하기'),
            ),
          )
        ],
      ),
    );
  }

}