import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class JakomoConcreteButton extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final String button;
  JakomoConcreteButton({Key? key, required this.supportUI, required this.jakomoColor,required this.button}) : super(key: key);

  late final TextStyle _textStyle = TextStyle(
      color: jakomoColor.boulder,
      fontFamily: supportUI.fontNanum('b'),
      fontSize: supportUI.resFontSize(13)
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.resWidth(148),
      height: supportUI.resWidth(52),
      decoration: BoxDecoration(
          color: jakomoColor.concrete,
          borderRadius: const BorderRadius.all(Radius.circular(28)),
      ),
      child: Center(
        child: Text(button, style: _textStyle,),
      ),
    );
  }
}