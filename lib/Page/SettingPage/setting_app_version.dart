import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class SettingAppVersion extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  SettingAppVersion({Key? key, required this.supportUI, required this.jakomoColor}):super(key: key);
  late final TextStyle _textStyle = TextStyle(
    color: jakomoColor.boulder,
    fontFamily: supportUI.fontNanum('b'),
    fontSize: supportUI.resFontSize(12),
    fontWeight: FontWeight.w400
  );
  late final TextStyle _textStyle2 = TextStyle(
      color: jakomoColor.black,
      fontFamily: supportUI.fontPoppings('bold'),
      fontSize: supportUI.resFontSize(12),
      fontWeight: FontWeight.w900
  );
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('앱 버전', style: _textStyle,),
        Padding(
          padding: EdgeInsets.only(left: supportUI.resWidth(4.5),top: supportUI.resWidth(3)),
          child: Text('V.0.1', style: _textStyle2,),
        )
      ],
    );
  }
}