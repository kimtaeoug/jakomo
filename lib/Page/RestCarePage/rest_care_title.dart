import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class RestCareTitle extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  RestCareTitle({Key? key, required this.supportUI, required this.jakomoColor}):super(key: key);
  late final TextStyle _titleTextStyle = TextStyle(
    color: jakomoColor.black,
    fontFamily: supportUI.fontNanum('eb'),
    fontWeight: FontWeight.w800,
    fontSize: supportUI.resFontSize(24)
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.deviceHeight,
      height: supportUI.resWidth(70),
      color: jakomoColor.white,
      child: Padding(
        padding: EdgeInsets.only(left: supportUI.resWidth(30)),
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text('휴식케어', style: _titleTextStyle,),
        ),
      ),
    );
  }
}