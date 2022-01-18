import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class SignInTop extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;

  SignInTop(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.commonUI})
      : super(key: key);
  late final TextStyle _textStyle = TextStyle(
      color: jakomoColor.boulder,
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontNanum('r'));

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        commonUI.pageTop('회원가입', ''),
        Padding(
          padding: EdgeInsets.only(
              top: supportUI.resHeight(7),
              left: supportUI.commonLeft(),
              bottom: supportUI.resHeight(37)),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              '가입 후 더 많은 혜택을 받아보세요.',
              style: _textStyle,
            ),
          ),
        )
      ],
    );
  }
}
