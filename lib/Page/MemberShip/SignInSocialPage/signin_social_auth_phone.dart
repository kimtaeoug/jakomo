import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_auth_timer.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_auth_timer_controller.dart';
import 'package:jakomo_recliner/Page/MemberShip/SignInPage/signin_controller.dart';
import 'package:jakomo_recliner/Page/MemberShip/SignInSocialPage/signin_social_controller.dart';
import 'package:jakomo_recliner/Page/MemberShip/SignInSocialPage/signin_social_timer.dart';
import 'package:jakomo_recliner/Page/MemberShip/SignInSocialPage/signin_social_timer_controller.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class SignInSocialAuthPhone extends StatefulWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;
  final TextStyle buttonTextStyle;
  final TextStyle valueTextStyle;

  const SignInSocialAuthPhone(
      {Key? key,
        required this.supportUI,
        required this.jakomoColor,
        required this.commonUI,
        required this.buttonTextStyle,
        required this.valueTextStyle})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignInSocialAuthPhone();
}

class _SignInSocialAuthPhone extends State<SignInSocialAuthPhone> {
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  late final CommonUI commonUI = widget.commonUI;
  late final TextStyle buttonTextStyle = widget.buttonTextStyle;
  late final TextStyle valueTextStyle = widget.valueTextStyle;

  final SignInSocialController signinController = Get.find();
  final SignInSocialTimerController signInSocialTimerController = Get.find();
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if(signInSocialTimerController.time.value == '00:01'){
        signinController.overFlowTime();
      }
      return signinController.requestAuth.value
          ? Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: supportUI.resHeight(12)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  commonUI.textForm(
                      Color(signinController.authPhoneColor.value),
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
                                signinController.validateAuthPhone(value);
                              },
                              cursorColor: jakomoColor.silver,
                              style: valueTextStyle,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: '인증번호 6자리',
                                hintStyle: TextStyle(
                                    color: Color(signinController.authPhoneLabelColor.value),
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
                            padding: EdgeInsets.only(
                                right: supportUI.resWidth(10)),
                            child: SignInSocialTimer(supportUI: supportUI, jakomoColor: jakomoColor),
                          )
                        ],
                      )),
                  signinController.errorAuthPhone.value != ''
                      ? commonUI.errorGuide(
                      signinController.errorAuthPhone.value)
                      : Container()
                ],
              ),
            ),
          ),
          !_isClicked
              ? Padding(
            padding:
            EdgeInsets.only(bottom: supportUI.resHeight(12)),
            child: commonUI.signinDot('인증번호 6자리'),
          )
              : Container()
        ],
      )
          : Container();
    });
  }
}
