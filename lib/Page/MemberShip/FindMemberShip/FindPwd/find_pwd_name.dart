import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'find_pwd_controller.dart';

class FindPwdName extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;
  final TextStyle valueTextStyle;

  FindPwdName(
      {Key? key,
        required this.supportUI,
        required this.jakomoColor,
        required this.commonUI,
        required this.valueTextStyle})
      : super(key: key);

  final FindPwdController findPwdController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: supportUI.resHeight(12)),
      child: Center(
        child: Obx((){
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              commonUI.textForm(
                  Color(findPwdController.nameColor.value),
                  TextFormField(
                    cursorColor: jakomoColor.silver,
                    style: valueTextStyle,
                    onChanged: (String? value){
                      findPwdController.validateName(value);
                    },
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: '이름',
                      labelStyle: TextStyle(
                          color: Color(findPwdController.nameLabelColor.value),
                          fontSize: supportUI.resFontSize(14),
                          fontFamily: supportUI.fontNanum('r')),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  )),
              findPwdController.nameError.value != ''
                  ? commonUI.errorGuide(findPwdController.nameError.value)
                  : Container()
            ],
          );
        }),
      ),
    );
  }

}