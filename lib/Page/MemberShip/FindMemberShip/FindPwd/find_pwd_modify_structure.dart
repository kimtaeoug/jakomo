import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/MemberShip/FindMemberShip/FindPwd/find_pwd_new.dart';
import 'package:jakomo_recliner/Page/MemberShip/FindMemberShip/FindPwd/find_pwd_new_check.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class FindPwdModifyStructure extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;
  FindPwdModifyStructure(
      {Key? key,
        required this.supportUI,
        required this.jakomoColor,
        required this.commonUI})
      : super(key: key);
  late final TextStyle textStyle = TextStyle(
    color: jakomoColor.black,
    fontWeight: FontWeight.bold,
    fontSize: supportUI.resFontSize(16),
    fontFamily: supportUI.fontNanum('r')
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: AlignmentDirectional.topStart,
          child: Padding(
            padding: EdgeInsets.only(bottom: supportUI.resHeight(17), left: supportUI.commonLeft()),
            child: Text('비밀번호를 재설정해주세요.', style: textStyle,),
          ),
        ),
        FindPwdNew(supportUI: supportUI, jakomoColor: jakomoColor, commonUI: commonUI),
        FindPwdNewCheck(supportUI: supportUI, jakomoColor: jakomoColor, commonUI: commonUI)
      ],
    );
  }
}