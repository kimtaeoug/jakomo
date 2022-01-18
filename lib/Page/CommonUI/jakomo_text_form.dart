import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class JakomoTextForm extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final Color color;
  final Widget widget;
  const JakomoTextForm(
      {Key? key, required this.supportUI, required this.jakomoColor, required this.color, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.deviceWidth * 5 / 6,
      height: supportUI.resWidth(56),
      decoration: BoxDecoration(
          color: jakomoColor.white,
          borderRadius:
          const BorderRadius.all(Radius.circular(12)),
          border: Border.all(color:color)),
      child: Padding(
        padding: EdgeInsets.only(left: supportUI.resWidth(20)),
        child: Center(
          child: widget,
        ),
      ),
    );
  }
}