import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/MemberShip/SignInSocialPage/signin_social_button.dart';
import 'package:jakomo_recliner/Page/MemberShip/SignInSocialPage/signin_social_controller.dart';
import 'package:jakomo_recliner/Routes/jakomo_routes.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class SignInSocialFooter extends StatefulWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;

  const SignInSocialFooter(
      {Key? key,
        required this.supportUI,
        required this.jakomoColor,
        required this.commonUI})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignInSocialFooter();
}

class _SignInSocialFooter extends State<SignInSocialFooter> {
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  late final CommonUI commonUI = widget.commonUI;
  bool _fold = false;
  late final TextStyle _textStyle = TextStyle(
      color: jakomoColor.boulder,
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontNanum('r'));
  late final TextStyle _seeTextStyle = TextStyle(
      color: jakomoColor.pistachio,
      fontSize: supportUI.resFontSize(12),
      fontFamily: supportUI.fontNanum('b'),
      decoration: TextDecoration.underline);
  final SignInSocialController signinController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: supportUI.resHeight(7), bottom: supportUI.resHeight(22)),
            child: Container(
              width: supportUI.deviceWidth,
              height: supportUI.resHeight(10),
              color: jakomoColor.concrete2,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: supportUI.commonLeft()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (signinController.didAllCheck.value == true) {
                            signinController.didAllCheck.value = false;
                            signinController.didTermCheck.value = false;
                            signinController.didPersonalCheck.value = false;
                            signinController.didMarketingCheck.value = false;
                            signinController.didEmailCheck.value = false;
                            signinController.didPhoneCheck.value = false;
                          } else {
                            signinController.didAllCheck.value = true;
                            signinController.didTermCheck.value = true;
                            signinController.didPersonalCheck.value = true;
                            signinController.didMarketingCheck.value = true;
                            signinController.didEmailCheck.value = true;
                            signinController.didPhoneCheck.value = true;
                          }
                        });
                      },
                      child: SizedBox(
                        width: supportUI.resWidth(18),
                        height: supportUI.resHeight(18),
                        child: Image.asset(signinController.didAllCheck.value
                            ? 'images/selected_checkbox.png'
                            : 'images/unselected_checkbox.png'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: supportUI.resWidth(10)),
                      child: Text(
                        '전체 동의',
                        style: _textStyle,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: supportUI.commonLeft()),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _fold = !_fold;
                    });
                  },
                  child: SizedBox(
                    width: supportUI.resWidth(24),
                    height: supportUI.resHeight(24),
                    child: Image.asset(_fold
                        ? 'images/fold_icon.png'
                        : 'images/dropdown_icon.png'),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: supportUI.resHeight(23)),
            child: Center(
              child: SizedBox(
                width: supportUI.deviceWidth * 5 / 6,
                height: supportUI.resHeight(1),
                child: DottedLine(
                  direction: Axis.horizontal,
                  lineLength: supportUI.deviceWidth * 5 / 6,
                  lineThickness: 1.0,
                  dashLength: supportUI.resWidth(4),
                  dashColor: jakomoColor.wildSand,
                  dashGapColor: jakomoColor.transperent,
                ),
              ),
            ),
          ),
          SizedBox(
            width: supportUI.deviceWidth,
            height: _fold ? supportUI.resHeight(225) : 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: supportUI.resHeight(28.5),
                      bottom: supportUI.resHeight(28)),
                  child: _checkBoxItem('term'),
                ),
                _checkBoxItem('personal'),
                Padding(
                  padding: EdgeInsets.only(
                      top: supportUI.resHeight(28),
                      bottom: supportUI.resHeight(35)),
                  child: _checkBoxItem('marketing'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: supportUI.resWidth(57),
                          right: supportUI.resWidth(11)),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if(signinController.didMarketingCheck.value == true){
                              signinController.didEmailCheck.value = !signinController.didEmailCheck.value;
                            }
                          });
                        },
                        child: SizedBox(
                          width: supportUI.resWidth(18),
                          height: supportUI.resHeight(18),
                          child: Image.asset(signinController.didEmailCheck.value
                              ? 'images/selected_checkbox.png'
                              : 'images/unselected_checkbox.png'),
                        ),
                      ),
                    ),
                    Text(
                      '이메일',
                      style: _textStyle,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: supportUI.resWidth(21),
                          right: supportUI.resWidth(11)),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if(signinController.didMarketingCheck.value == true){
                              signinController.didPhoneCheck.value = !signinController.didPhoneCheck.value;
                            }
                          });
                        },
                        child: SizedBox(
                          width: supportUI.resWidth(18),
                          height: supportUI.resHeight(18),
                          child: Image.asset(signinController.didPhoneCheck.value
                              ? 'images/selected_checkbox.png'
                              : 'images/unselected_checkbox.png'),
                        ),
                      ),
                    ),
                    Text(
                      '휴대폰',
                      style: _textStyle,
                    )
                  ],
                )
              ],
            ),
          ),
          SigninSocialButton(supportUI: supportUI, jakomoColor: jakomoColor, commonUI: commonUI)
        ],
      );
    });
  }

  Widget _checkBoxItem(String name) {
    String result = '[필수] 이용약관';
    switch (name) {
      case 'personal':
        result = '[필수] 개인정보수집동의';
        break;
      case 'marketing':
        result = '[선택] 마케팅 활용동의';
        break;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: supportUI.commonLeft()),
          child: GestureDetector(
            onTap: () {
              setState(() {
                if (name == 'term') {
                  signinController.didTermCheck.value = !signinController.didTermCheck.value;
                  if(signinController.didAllCheck.value == true){
                    signinController.didAllCheck.value = false;
                  }
                }
                if (name == 'personal') {
                  signinController.didPersonalCheck.value = !signinController.didPersonalCheck.value;
                  if(signinController.didAllCheck.value == true){
                    signinController.didAllCheck.value = false;
                  }
                }
                if (name == 'marketing') {
                  if(signinController.didMarketingCheck.value == true){
                    signinController.didMarketingCheck.value = false;
                    signinController.didEmailCheck.value = false;
                    signinController.didPhoneCheck.value = false;
                    if(signinController.didAllCheck.value == true){
                      signinController.didAllCheck.value = false;
                    }
                  }else{
                    signinController.didMarketingCheck.value = true;
                    signinController.didEmailCheck.value = true;
                    signinController.didPhoneCheck.value = true;
                  }
                }
              });
            },
            child: SizedBox(
              width: supportUI.resWidth(18),
              height: supportUI.resHeight(18),
              child: Image.asset(_wichCheck(name)
                  ? 'images/selected_checkbox.png'
                  : 'images/unselected_checkbox.png'),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              right: supportUI.resWidth(4), left: supportUI.resWidth(11)),
          child: Text(
            result,
            style: _textStyle,
          ),
        ),
        GestureDetector(
          onTap: () {
            switch(name){
              case 'personal':
                Get.toNamed(JakomoRoutes.personal);
                break;
              case 'marketing':
                Get.toNamed(JakomoRoutes.marketing);
                break;
              default:
                Get.toNamed(JakomoRoutes.term);
                break;
            }
          },
          child: Text(
            '보기',
            style: _seeTextStyle,
          ),
        )
      ],
    );
  }

  bool _wichCheck(String name) {
    bool result = signinController.didTermCheck.value;
    switch (name) {
      case 'personal':
        result = signinController.didPersonalCheck.value;
        break;
      case 'marketing':
        result = signinController.didMarketingCheck.value;
        break;
    }
    return result;
  }
}
