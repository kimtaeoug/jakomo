import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_auth_timer_controller.dart';
import 'package:jakomo_recliner/Page/MemberShip/FindMemberShip/FindPwd/find_pwd_controller.dart';
import 'package:jakomo_recliner/Page/MemberShip/FindMemberShip/FindPwd/find_pwd_timer_controller.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class FindPwdPhone extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;
  final TextStyle valueTextStyle;
  FindPwdPhone({Key? key, required this.supportUI, required this.jakomoColor, required this.commonUI, required this.valueTextStyle}):super(key: key);

  late final TextStyle buttonTextStyle = TextStyle(
      color: jakomoColor.mineShaft,
      fontSize: supportUI.resFontSize(10),
      fontFamily: supportUI.fontNanum('b'));

  final FindPwdController findPwdController = Get.find();
  final FindPwdTimerController findPwdTimerController = Get.find();
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
                  Color(findPwdController.phoneColor.value),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: supportUI.resWidth(200),
                        child: TextFormField(
                          onChanged: (String? value) {
                            findPwdController.validatePhone(value);
                          },
                          cursorColor: jakomoColor.silver,
                          style: valueTextStyle,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: '휴대폰',
                            hintStyle: TextStyle(
                                color: Color(findPwdController.phoneLabelColor.value),
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
                            if(findPwdController.canAuth.value){
                              if(findPwdTimerController.time.value != ''){
                                findPwdTimerController.killTimer();
                              }
                              findPwdController.requestAuth.value = true;
                              findPwdController.resetAuthPhone();
                              findPwdTimerController.startAuthTimer();
                            }else{
                              findPwdController.errorAuthPhoneButton();
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
                                findPwdController.requestAuth.value?'다시 요청':'인증',
                                style: buttonTextStyle,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
              findPwdController.errorPhone.value != ''
                  ? commonUI.errorGuide(findPwdController.errorPhone.value)
                  : Container()
            ],
          );
        }),
      ),
    );
  }

}