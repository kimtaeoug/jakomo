import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'find_pwd_controller.dart';

class FindPwdNew extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;
  FindPwdNew({Key? key, required this.supportUI, required this.jakomoColor, required this.commonUI}):super(key: key);
  final FindPwdController findPwdController = Get.find();
  final GlobalKey<FormState> _pwdKey = GlobalKey<FormState>();
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
                  Color(findPwdController.pwdColor.value),
                  Form(
                    key: _pwdKey,
                    child: TextFormField(
                      obscureText: true,
                      onChanged: (String? value) {
                        findPwdController.validatePwd(value);
                      },
                      cursorColor: jakomoColor.silver,
                      decoration: InputDecoration(
                        hintText: '신규 비밀번호',
                        hintStyle: TextStyle(
                            color: Color(findPwdController.pwdLabelColor.value),
                            fontSize: supportUI.resFontSize(14),
                            fontFamily: supportUI.fontNanum('r')),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  )),
              findPwdController.errorPwd.value != ''
                  ? commonUI.errorGuide(findPwdController.errorPwd.value)
                  : Container()
            ],
          );
        }),
      ),
    );
  }

}