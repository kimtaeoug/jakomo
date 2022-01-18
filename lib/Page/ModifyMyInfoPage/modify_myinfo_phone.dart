import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'modify_controller.dart';

class ModifyMyinfoPhone extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;

  ModifyMyinfoPhone(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.commonUI})
      : super(key: key);
  late final TextStyle _valueTextStyle = TextStyle(
      color: jakomoColor.black,
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontPoppings('regular'));
  late final TextStyle _buttonTextStyle = TextStyle(
      color: jakomoColor.mineShaft,
      fontSize: supportUI.resFontSize(10),
      fontFamily: supportUI.fontNanum('b'));

  final GlobalKey<FormState> _phoneKey = GlobalKey<FormState>();
  final ModifyController modifyController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: supportUI.resHeight(12)),
      child: Obx(() {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            commonUI.textForm(
                Color(modifyController.phoneColor.value),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Form(
                      key: _phoneKey,
                      child: SizedBox(
                        width: supportUI.deviceWidth * 5 / 6 -
                            supportUI.resWidth(100),
                        child: TextFormField(
                          onChanged: (String? value) {
                            modifyController.validatePhone(value);
                          },
                          style: _valueTextStyle,
                          initialValue: '01012345678',
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: '휴대폰',
                            labelStyle: TextStyle(
                                color: modifyController.phoneError.value != ''
                                    ? jakomoColor.red
                                    : jakomoColor.boulder,
                                fontSize: supportUI.resFontSize(10),
                                fontFamily: supportUI.fontNanum('r')),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          if (modifyController.phoneError.value == '') {
                            modifyController.requestAuthentification.value =
                                true;
                          }
                        },
                        child: Center(
                          child: Container(
                            width: supportUI.resWidth(65),
                            height: supportUI.resHeight(36),
                            decoration: BoxDecoration(
                                color: jakomoColor.athensGray2,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(4))),
                            child: Center(
                              child: Text(
                                modifyController.requestAuthentification.value
                                    ? '다시 요청'
                                    : '인증',
                                style: _buttonTextStyle,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            modifyController.phoneError.value != ''
                ? commonUI.errorGuide(modifyController.phoneError.value)
                : Container()
          ],
        );
      }),
    );
  }
}
