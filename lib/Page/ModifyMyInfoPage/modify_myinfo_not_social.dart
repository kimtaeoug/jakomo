import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/ModifyMyInfoPage/modify_controller.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class ModifyMyinfoNotSocial extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;

  ModifyMyinfoNotSocial(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.commonUI})
      : super(key: key);
  late final TextStyle _hintPwdTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontNanum('r'));
  final ModifyController modifyController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          commonUI.textForm(
            Color(modifyController.existingColor.value),
              TextFormField(
                onChanged: (String? value) {
                  modifyController.validateExistingPwd(value);
                },
                cursorColor: jakomoColor.silver,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '기존 비밀번호',
                  hintStyle: _hintPwdTextStyle,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              )),
          modifyController.errorExistingPwd.value != ''
              ? commonUI.errorGuide(modifyController.errorExistingPwd.value)
              : Container(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: supportUI.resHeight(12)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                commonUI.textForm(
                    Color(modifyController.newPwdColor.value),
                    TextFormField(
                      onChanged: (String? value) {
                        modifyController.validateNewPwd(value);
                      },
                      cursorColor: jakomoColor.silver,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: '신규 비밀번호',
                        hintStyle: _hintPwdTextStyle,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    )),
                modifyController.errorNewPwd.value != ''
                    ? commonUI
                        .errorGuide(modifyController.errorNewPwd.value)
                    : Container()
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: supportUI.resHeight(12)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                commonUI.textForm(
                    Color(modifyController.checkPwdColor.value),
                    TextFormField(
                      onChanged: (String? value) {
                        modifyController.validateCheckPwd(value);
                      },
                      cursorColor: jakomoColor.silver,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: '신규 비밀번호 확인',
                        hintStyle: _hintPwdTextStyle,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    )),
                modifyController.errorCheckPwd.value != ''
                    ? commonUI
                        .errorGuide(modifyController.errorCheckPwd.value)
                    : Container()
              ],
            ),
          )
        ],
      );
    });
  }
}
