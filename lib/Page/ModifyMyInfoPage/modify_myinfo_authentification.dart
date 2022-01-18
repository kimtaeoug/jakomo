import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/ModifyMyInfoPage/modify_controller.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class ModifyMyinfoAuthentification extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;

  ModifyMyinfoAuthentification(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.commonUI})
      : super(key: key);
  final ModifyController modifyController = Get.find();
  late final TextStyle _valueTextStyle = TextStyle(
      color: jakomoColor.black,
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontPoppings('regular'));

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(() {
        return modifyController.requestAuthentification.value
            ? Padding(
                padding: EdgeInsets.only(bottom: supportUI.resHeight(12)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    commonUI.textForm(
                        Color(modifyController.authColor.value),
                        TextFormField(
                          style: _valueTextStyle,
                          keyboardType: TextInputType.number,
                          onChanged: (String? value) {
                            modifyController.validateAuthentification(value);
                          },
                          decoration: InputDecoration(
                            labelText: '인증번호 6 자리',
                            labelStyle: TextStyle(
                                color: modifyController
                                            .errorAuthentification.value ==
                                        ''
                                    ? jakomoColor.boulder
                                    : jakomoColor.red,
                                fontSize: supportUI.resFontSize(10),
                                fontFamily: supportUI.fontNanum('r')),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        )),
                    modifyController.errorAuthentification.value != ''
                        ? commonUI.errorGuide(
                            modifyController.errorAuthentification.value)
                        : Container()
                  ],
                ),
              )
            : Container();
      }),
    );
  }

}
