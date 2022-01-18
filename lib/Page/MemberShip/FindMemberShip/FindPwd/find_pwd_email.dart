import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/MemberShip/FindMemberShip/FindPwd/find_pwd_controller.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class FindPwdEmail extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;
  final TextStyle valueTextStyle;
  FindPwdEmail(
      {Key? key,
        required this.supportUI,
        required this.jakomoColor,
        required this.commonUI,
        required this.valueTextStyle
      })
      : super(key: key);

  final FindPwdController findPwdController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: supportUI.resHeight(12)),
      child: Center(
        child: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              commonUI.textForm(
                  Color(findPwdController.idColor.value),
                  TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'[a-zA-Z0-9@.]+$'))
                    ],
                    onChanged: (String? value) {
                      findPwdController.validateEmail(value);
                    },
                    cursorColor: jakomoColor.silver,
                    style: valueTextStyle,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: '이메일(아이디)',
                      labelStyle: TextStyle(
                          color: Color(findPwdController.idLabelColor.value),
                          fontSize: supportUI.resFontSize(14),
                          fontFamily: supportUI.fontNanum('r')),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  )),
              findPwdController.errorId.value != ''
                  ? commonUI.errorGuide(findPwdController.errorId.value)
                  : Container()
            ],
          );
        }),
      ),
    );
  }
}