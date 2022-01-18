import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_auth_timer_controller.dart';
import 'package:jakomo_recliner/Page/MemberShip/SignInPage/signin_controller.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class SignInPhone extends StatefulWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;
  final TextStyle buttonTextStyle;
  final TextStyle valueTextStyle;

  const SignInPhone(
      {Key? key,
        required this.supportUI,
        required this.jakomoColor,
        required this.commonUI,
        required this.buttonTextStyle,
        required this.valueTextStyle})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignInPhone();
}

class _SignInPhone extends State<SignInPhone> {
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  late final CommonUI commonUI = widget.commonUI;
  late final TextStyle buttonTextStyle = widget.buttonTextStyle;
  late final TextStyle valueTextStyle = widget.valueTextStyle;

  final SigninController signinController = Get.find();
  bool _isClicked = false;
  final JakomoAuthTimerController jakomoAuthTimerController = Get.find();
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
                      Color(signinController.phoneColor.value),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: supportUI.resWidth(200),
                            child: TextFormField(
                              onTap: () {
                                setState(() {
                                  _isClicked = true;
                                });
                              },
                              onChanged: (String? value) {
                                signinController.validatePhone(value);
                              },
                              cursorColor: jakomoColor.silver,
                              style: valueTextStyle,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                hintText: '휴대폰 간편인증',
                                hintStyle: TextStyle(
                                    color: Color(signinController.phoneLabelColor.value),
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
                            child: GestureDetector(
                              onTap: () {
                                if(signinController.canAuth.value){
                                  if(jakomoAuthTimerController.time.value != ''){
                                    jakomoAuthTimerController.killTimer();
                                  }
                                  signinController.requestAuth.value = true;
                                  signinController.resetAuthPhone();
                                  jakomoAuthTimerController.startAuthTimer();
                                }else{
                                  signinController.errorAuthPhoneButton();
                                }
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
                                    signinController.requestAuth.value?'다시 요청':'인증',
                                    style: buttonTextStyle,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                  signinController.errorPhone.value != ''
                      ? commonUI.errorGuide(signinController.errorPhone.value)
                      : Container()
                ],
              );
            }),
          ),
        ),
        !_isClicked
            ? Padding(
          padding: EdgeInsets.only(bottom: supportUI.resHeight(12)),
          child: commonUI.signinDot('휴대폰 간편인증',),
        )
            : Container()
      ],
    );
  }
}
