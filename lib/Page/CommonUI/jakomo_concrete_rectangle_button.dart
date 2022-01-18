import 'package:flutter/material.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class JakomoConcreteRectangleButton extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final String button;
  JakomoConcreteRectangleButton({Key? key, required this.supportUI, required this.jakomoColor,required this.button}) : super(key: key);

  late final TextStyle _measureTextStyle = TextStyle(
      color: jakomoColor.white,
      fontFamily: supportUI.fontNanum('b'),
      fontSize: supportUI.resFontSize(14)
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.deviceWidth*5/6,
      height: supportUI.resWidth(52),
      decoration: BoxDecoration(
          color: jakomoColor.concrete,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Center(
        child: Text(button, style: _measureTextStyle,),
      ),
    );
  }
}