import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'login_controller.dart';

class LoginPwd extends StatefulWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;

  const LoginPwd(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.commonUI})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPwd();
}

class _LoginPwd extends State<LoginPwd> {
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  late final CommonUI commonUI = widget.commonUI;
  late final TextStyle _hintTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontNanum('r'));
  final LoginController loginController = Get.find();
  final GlobalKey<FormState> _pwdKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    loginController.setPwdKey(_pwdKey);
    return Padding(
      padding: EdgeInsets.only(bottom: supportUI.resHeight(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Obx(() {
            return commonUI.textForm(
                Color(loginController.pwdColor.value),
                Form(
                  key: _pwdKey,
                  child: TextFormField(
                    onChanged: (String? value) {
                      loginController.pwdLiveRestriction(value);
                    },
                    onSaved: (String? value) {
                      loginController.pwdSucceed(value);
                    },
                    onFieldSubmitted: (String? value) {
                      loginController.pwdLiveRestriction(value);
                    },
                    obscureText: true,
                    cursorColor: jakomoColor.silver,
                    decoration: _pwdInputDecoration,
                  ),
                ));
          }),
          Obx(() {
            return
            loginController.pwdError.value == ''?
                Container():
                commonUI.errorGuide(loginController.pwdError.value);
          })
        ],
      ),
    );
  }

  late final InputDecoration _pwdInputDecoration = InputDecoration(
    labelText: '비밀번호',
    labelStyle: _hintTextStyle,
    border: InputBorder.none,
    focusedBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    errorBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
  );
}
