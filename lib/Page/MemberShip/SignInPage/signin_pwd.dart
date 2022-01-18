import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/MemberShip/SignInPage/signin_controller.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class SignInPwd extends StatefulWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;

  SignInPwd(
      {Key? key,
        required this.supportUI,
        required this.jakomoColor,
        required this.commonUI,
      })
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignInPwd();
}
class _SignInPwd extends State<SignInPwd> {
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  late final CommonUI commonUI = widget.commonUI;

  final SigninController signinController = Get.find();
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: supportUI.resHeight(12)),
          child: Center(
            child: Obx(() {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  commonUI.textForm(
                      Color(signinController.pwdColor.value),
                      TextFormField(
                        obscureText: true,
                        onTap: () {
                          setState(() {
                            _isClicked = true;
                          });
                        },
                        cursorColor : jakomoColor.silver,
                        onChanged: (String? value) {
                          signinController.validatePwd(value);
                        },
                        decoration: InputDecoration(
                          hintText: '비밀번호',
                          hintStyle: TextStyle(
                              color: Color(signinController.pwdLabelColor.value),
                              fontSize: supportUI.resFontSize(14),
                              fontFamily: supportUI.fontNanum('r')),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      )),
                  signinController.errorPwd.value != ''
                      ? commonUI.errorGuide(signinController.errorPwd.value)
                      : Container()
                ],
              );
            }),
          ),
        ),
        !_isClicked
            ? Padding(
          padding: EdgeInsets.only(bottom: supportUI.resHeight(12)),
          child: commonUI.signinDot('비밀번호'),
        )
            : Container()
      ],
    );
  }
}