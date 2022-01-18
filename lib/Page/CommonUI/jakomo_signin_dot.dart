import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class JakomoSigninDot extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final String text;
  JakomoSigninDot({Key? key, required this.supportUI, required this.jakomoColor, required this.text}):super(key: key);
  late final TextStyle textStyle = TextStyle(
      color: jakomoColor.boulder,
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontNanum('r'));
  late final Size _size = supportUI.getTextSize('$text  ', textStyle);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: supportUI.deviceWidth*5/6,
        height: supportUI.resWidth(56),
        child: Padding(
          padding: EdgeInsets.only(left: supportUI.resWidth(22) + _size.width),
          child: Center(
            child: SizedBox(
              height: _size.height-supportUI.resWidth(5),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: Container(
                  width: supportUI.resWidth(4),
                  height: supportUI.resWidth(4),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: jakomoColor.froly
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
