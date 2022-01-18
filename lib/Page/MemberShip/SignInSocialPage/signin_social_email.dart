import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/MemberShip/SignInSocialPage/signin_social_controller.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class SignInSocialEmail extends StatefulWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;
  final TextStyle buttonTextStyle;
  final TextStyle valueTextStyle;

  const SignInSocialEmail(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.commonUI,
      required this.buttonTextStyle,
      required this.valueTextStyle})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignInSocialEmail();
}

class _SignInSocialEmail extends State<SignInSocialEmail> {
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  late final CommonUI commonUI = widget.commonUI;
  late final TextStyle buttonTextStyle = widget.buttonTextStyle;
  late final TextStyle valueTextStyle = widget.valueTextStyle;

  final SignInSocialController signinController = Get.find();
  final GlobalKey<FormState> _idKey = GlobalKey<FormState>();
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    signinController.setIdKey(_idKey);
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
                      Color(signinController.idColor.value),
                      Form(
                        key: _idKey,
                        child: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[a-zA-Z0-9@.]+$'))
                          ],
                          onTap: () {
                            setState(() {
                              _isClicked = true;
                            });
                          },
                          onChanged: (String? value) {
                            signinController.validateEmail(value);
                          },
                          cursorColor: jakomoColor.silver,
                          style: valueTextStyle,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: '이메일',
                            labelStyle: TextStyle(
                                color: Color(signinController.idLabelColor.value),
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
                  signinController.errorId.value != ''
                      ? commonUI.errorGuide(signinController.errorId.value)
                      : Container()
                ],
              );
            }),
          ),
        ),
        !_isClicked
            ? Padding(
                padding: EdgeInsets.only(bottom: supportUI.resHeight(12)),
                child: commonUI.signinDot('이메일'),
              )
            : Container()
      ],
    );
  }
}
