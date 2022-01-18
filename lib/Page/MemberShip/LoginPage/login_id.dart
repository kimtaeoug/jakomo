import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/MemberShip/LoginPage/login_controller.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class LoginId extends StatefulWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;

  const LoginId(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.commonUI})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginId();
}

class _LoginId extends State<LoginId> {
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  late final CommonUI commonUI = widget.commonUI;
  late final TextStyle _valueTextStyle = TextStyle(
      color: jakomoColor.black,
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontPoppings('regular'));
  final GlobalKey<FormState> _idKey = GlobalKey<FormState>();
  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    loginController.setIdKey(_idKey);
    return Padding(
      padding: EdgeInsets.only(bottom: supportUI.resHeight(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Obx(() {
            return commonUI.textForm(
                Color(loginController.idColor.value),
                Form(
                  key: _idKey,
                  child: TextFormField(
                    onChanged: (String? value) {
                      loginController.emailLiveRestriction(value);
                    },
                    onSaved: (String? value) {
                      loginController.emailSucceed(value);
                    },
                    onFieldSubmitted: (String? value) {
                      loginController.emailSucceed(value);
                    },
                    style: _valueTextStyle,
                    cursorColor: jakomoColor.silver,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: '아이디',
                      labelStyle: TextStyle(
                          fontFamily: supportUI.fontNanum('r'),
                          color: Color(loginController.idLabelColor.value),
                          fontSize: supportUI.resFontSize(14)),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ));
          }),
          Obx(() {
            return loginController.idError.value == ''
                ? Container()
                : commonUI.errorGuide(loginController.idError.value);
          })
        ],
      ),
    );
  }
}
