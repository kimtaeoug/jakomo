import 'package:flutter/material.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class FindMemberShipTop extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;

  FindMemberShipTop(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.commonUI})
      : super(key: key);
  late final TextStyle _textStyle = TextStyle(
      fontFamily: supportUI.fontNanum('r'),
      fontSize: supportUI.resFontSize(14),
      color: jakomoColor.boulder);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        commonUI.pageTop('계정찾기', ''),
        Padding(
          padding: EdgeInsets.only(
              top: supportUI.resHeight(7),
              bottom: supportUI.resHeight(55),
              left: supportUI.commonLeft()),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              '본인인증을 통해 아이디(이메일) 확인 및\n비밀번호를 변경하실 수 있습니다.',
              style: _textStyle,
              textAlign: TextAlign.start,
            ),
          ),
        )
      ],
    );
  }
}
