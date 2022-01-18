import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_auth_timer.dart';
import 'package:jakomo_recliner/Page/MemberShip/FindMemberShip/FindPwd/find_pwd_controller.dart';
import 'package:jakomo_recliner/Page/MemberShip/FindMemberShip/FindPwd/find_pwd_timer.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';
import 'package:get/get.dart';

import 'find_pwd_timer_controller.dart';


class FindPwdAuthPhone extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;
  final TextStyle valueTextStyle;
  FindPwdAuthPhone({Key? key, required this.supportUI, required this.jakomoColor, required this.commonUI, required this.valueTextStyle}):super(key: key);
  final FindPwdController findPwdController = Get.find();
  final FindPwdTimerController findPwdTimerController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if(findPwdTimerController.time.value == '00:01'){
        findPwdController.overFlowTime();
      }
      return findPwdController.requestAuth.value == true?
      Padding(
        padding: EdgeInsets.only(bottom: supportUI.resHeight(12)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              commonUI.textForm(
                  Color(findPwdController.authPhoneColor.value),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: supportUI.resWidth(200),
                        child: TextFormField(
                          onChanged: (String? value) {
                            findPwdController.validateAuthPhone(value);
                          },
                          cursorColor: jakomoColor.silver,
                          style: valueTextStyle,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: '인증번호 6자리',
                            hintStyle: TextStyle(
                                color: Color(findPwdController.authPhoneLabelColor.value),
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
                        child: FindPwdTimer(supportUI: supportUI, jakomoColor: jakomoColor),
                      )
                    ],
                  )),
              findPwdController.errorAuthPhone.value != ''
                  ? commonUI.errorGuide(
                  findPwdController.errorAuthPhone.value)
                  : Container()
            ],
          ),
        ),
      ):Container();
    });
  }

}