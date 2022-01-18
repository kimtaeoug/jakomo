import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class ModifyMyinfoFooter extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;
  ModifyMyinfoFooter(
      {Key? key, required this.supportUI, required this.jakomoColor, required this.commonUI})
      : super(key: key);
  late final TextStyle _secessionTextStyle = TextStyle(
      color : jakomoColor.boulder,
      decoration: TextDecoration.underline,
      fontSize: supportUI.resFontSize(12),
      fontWeight: FontWeight.w800,
      fontFamily: supportUI.fontNanum('b'));

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: supportUI.resWidth(35), bottom: supportUI.resWidth(17)),
          child: Container(
            width: supportUI.deviceWidth,
            height: supportUI.resWidth(10),
            color: jakomoColor.concrete.withOpacity(0.6),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: supportUI.commonLeft(), bottom: supportUI.resWidth(35)),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: GestureDetector(
              onTap: (){
                Get.toNamed('widthdrawal');
              },
              child: Text('회원탈퇴', style: _secessionTextStyle, ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: supportUI.resWidth(24)),
          child: GestureDetector(
            onTap: (){},
            child: commonUI.pistachioRectangleButton('저장'),
          ),
        )
      ],
    );
  }
}