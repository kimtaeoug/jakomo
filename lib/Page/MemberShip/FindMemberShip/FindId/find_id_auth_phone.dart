import 'package:flutter/material.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/MemberShip/FindMemberShip/FindId/find_id_timer.dart';
import 'package:jakomo_recliner/Page/MemberShip/FindMemberShip/FindId/find_id_timer_controller.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';
import 'package:get/get.dart';
import 'find_id_controller.dart';

class FindIdAuthPhone extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;
  final TextStyle valueTextStyle;
  FindIdAuthPhone({Key? key, required this.supportUI, required this.jakomoColor, required this.commonUI, required this.valueTextStyle}):super(key: key);
  final FindIdController findIdController = Get.find();
  final FindIdTimerController findIdTimerController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if(findIdTimerController.time.value == '00:01'){
        findIdController.overFlowTime();
      }
      return findIdController.requestAuth.value == true?
      Padding(
        padding: EdgeInsets.only(bottom: supportUI.resHeight(12)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              commonUI.textForm(
                  Color(findIdController.authPhoneColor.value),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: supportUI.resWidth(200),
                        child: TextFormField(
                          onChanged: (String? value) {
                            findIdController.validateAuthPhone(value);
                          },
                          cursorColor: jakomoColor.silver,
                          style: valueTextStyle,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: '인증번호 6자리',
                            hintStyle: TextStyle(
                                color: Color(findIdController.authPhoneLabelColor.value),
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
                        child: FindIdTimer(supportUI: supportUI, jakomoColor: jakomoColor),
                      )
                    ],
                  )),
              findIdController.errorAuthPhone.value != ''
                  ? commonUI.errorGuide(
                  findIdController.errorAuthPhone.value)
                  : Container()
            ],
          ),
        ),
      ):Container();
    });
  }

}