import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class JakomoPageTop extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final String title;
  final String titleEn;
  JakomoPageTop({Key? key, required this.supportUI, required this.jakomoColor,required this.title, required this.titleEn}) : super(key: key);
  late final TextStyle _titleTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: supportUI.fontNanum('eb'),
      fontSize: supportUI.resFontSize(24),
      color: jakomoColor.black);
  late final TextStyle _titleEnTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: supportUI.fontPoppings('semibold'),
      fontSize: supportUI.resFontSize(24),
      color: jakomoColor.black);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: supportUI.resWidth(supportUI.commonLeft()-supportUI.resWidth(10)),
              top: supportUI.resWidth(28),
              bottom: supportUI.resWidth(35)),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: GestureDetector(
              onTapDown: (TapDownDetails detail){
                Get.back();
              },
              child: SizedBox(
                width: supportUI.resWidth(30),
                height: supportUI.resHeight(30),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: SizedBox(
                    width: supportUI.resWidth(9),
                    height: supportUI.resWidth(15),
                    child: Image.asset('images/back_icon.png', width: supportUI.resWidth(9), height: supportUI.resHeight(15),),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: supportUI.commonLeft()),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: Text.rich(
              TextSpan(
                children: [
                 TextSpan(
                    text: titleEn,
                    style: _titleEnTextStyle
                  ),
                  TextSpan(
                    text: title,
                    style: _titleTextStyle
                  )
                ]
              )
            ),
          ),
        )
      ],
    );
  }
}