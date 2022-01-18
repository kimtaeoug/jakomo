import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class JakomoPistachioBorderButton extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final String button;
  JakomoPistachioBorderButton(
      {Key? key, required this.supportUI, required this.jakomoColor, required this.button})
      : super(key: key);
  late final TextStyle _textStyle = TextStyle(
      color: jakomoColor.pistachio,
      fontFamily: supportUI.fontNanum('eb'),
      fontSize: supportUI.resFontSize(14),
      fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.resWidth(132) ,
      height: supportUI.resWidth(52) ,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(28)),
          border: Border.all(color: jakomoColor.pistachio),
          color: jakomoColor.white),
      child: Center(
        child: Text(
          button,
          style: _textStyle,
        ),
      ),
    );
  }
}