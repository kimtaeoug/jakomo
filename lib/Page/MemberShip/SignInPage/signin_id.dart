import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/MemberShip/SignInPage/signin_controller.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class SignInId extends StatefulWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;
  final TextStyle buttonTextStyle;
  final TextStyle valueTextStyle;

  const SignInId(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.commonUI,
      required this.buttonTextStyle,
      required this.valueTextStyle})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignInId();
}

class _SignInId extends State<SignInId> {
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  late final CommonUI commonUI = widget.commonUI;
  late final TextStyle buttonTextStyle = widget.buttonTextStyle;
  late final TextStyle valueTextStyle = widget.valueTextStyle;

  final SigninController signinController = Get.find();
  bool _isClicked = false;
  String inputID = '';

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
                      Color(signinController.idColor.value),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: supportUI.resWidth(200),
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
                                if (value != null) {
                                  setState(() {
                                    inputID = value;
                                  });
                                }
                              },
                              cursorColor: jakomoColor.silver,
                              style: valueTextStyle,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: '이메일(아이디)',
                                labelStyle: TextStyle(
                                    color: Color(
                                        signinController.idLabelColor.value),
                                    fontSize: supportUI.resFontSize(14),
                                    fontFamily: supportUI.fontNanum('r')),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(right: supportUI.resWidth(10)),
                            child: signinController.didDoubleCheck.value
                                ? SizedBox(
                                    width: supportUI.resWidth(65),
                                    height: supportUI.resHeight(36),
                                    child: Center(
                                      child: SizedBox(
                                        width: supportUI.resWidth(24),
                                        height: supportUI.resHeight(24),
                                        child: Image.asset(
                                          'images/confirmed_check_icon.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      signinController.doubleCheck(inputID);
                                      print('hey');
                                    },
                                    child: Container(
                                      width: supportUI.resWidth(65),
                                      height: supportUI.resHeight(36),
                                      decoration: BoxDecoration(
                                          color: jakomoColor.athensGray,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(4))),
                                      child: Center(
                                        child: Text(
                                          '중복확인',
                                          style: buttonTextStyle,
                                        ),
                                      ),
                                    ),
                                  ),
                          )
                        ],
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
                child: commonUI.signinDot('이메일(아이디)'),
              )
            : Container()
      ],
    );
  }
}
