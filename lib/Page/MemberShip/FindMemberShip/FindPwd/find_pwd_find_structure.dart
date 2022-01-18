import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'find_pwd_auth_phone.dart';
import 'find_pwd_email.dart';
import 'find_pwd_name.dart';
import 'find_pwd_phone.dart';

class FindPwdFindStructure extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;

  FindPwdFindStructure(
      {Key? key,
        required this.supportUI,
        required this.jakomoColor,
        required this.commonUI})
      : super(key: key);
  late final TextStyle valueTextStyle = TextStyle(
      color: jakomoColor.black,
      fontFamily: supportUI.fontNanum('r'),
      fontSize: supportUI.resFontSize(14));
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FindPwdEmail(
            supportUI: supportUI,
            jakomoColor: jakomoColor,
            commonUI: commonUI,
            valueTextStyle: valueTextStyle),
        FindPwdName(
            supportUI: supportUI,
            jakomoColor: jakomoColor,
            commonUI: commonUI,
            valueTextStyle: valueTextStyle),
        FindPwdPhone(
            supportUI: supportUI,
            jakomoColor: jakomoColor,
            commonUI: commonUI,
            valueTextStyle: valueTextStyle),
        FindPwdAuthPhone(
            supportUI: supportUI,
            jakomoColor: jakomoColor,
            commonUI: commonUI,
            valueTextStyle: valueTextStyle)
      ],
    );
  }
}