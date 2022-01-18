import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class JakomoErrorGuide extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final String errorText;

  JakomoErrorGuide(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.errorText})
      : super(key: key);
  late final TextStyle _errorTextStyle = TextStyle(
    color: jakomoColor.red,
    fontSize: supportUI.resFontSize(12),
    fontFamily: supportUI.fontNanum('r'),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: supportUI.resWidth(4) + supportUI.commonLeft(),
          top: supportUI.resWidth(6)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: supportUI.resWidth(18),
            height: supportUI.resWidth(18),
            child: Image.asset('images/red_info_icon.png'),
          ),
          Padding(
            padding: EdgeInsets.only(left: supportUI.resWidth(4)),
            child: SizedBox(
              height: supportUI.resWidth(18),
              child: Center(
                child: Text(
                  errorText,
                  style: _errorTextStyle,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
