import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class ASApplicationFormTop extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  ASApplicationFormTop(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);
  late final TextStyle _titleEnTextStyle = TextStyle(
      color: jakomoColor.black,
      fontFamily: supportUI.fontPoppings('semibold'),
      fontSize: supportUI.resFontSize(24),
      fontWeight: FontWeight.bold);
  late final TextStyle _titleKrTextStyle = TextStyle(
      color: jakomoColor.black,
      fontFamily: supportUI.fontNanum('eb'),
      fontSize: supportUI.resFontSize(24),
      fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: supportUI.resHeight(28),
              left: supportUI.commonLeft(),
              bottom: supportUI.resHeight(24)),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: SizedBox(
                width: supportUI.resWidth(9),
                height: supportUI.resHeight(15),
                child: Image.asset('images/back_icon.png'),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: supportUI.commonLeft(), bottom: supportUI.resHeight(36)),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: Text.rich(TextSpan(children: [
              TextSpan(text: 'AS ', style: _titleEnTextStyle),
              TextSpan(text: '신청하기', style: _titleKrTextStyle)
            ])),
          ),
        )
      ],
    );
  }
}
