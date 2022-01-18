import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/MemberShip/FindMemberShip/FindId/find_id_controller.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class FindIdName extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;
  final TextStyle valueTextStyle;

  FindIdName(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.commonUI,
      required this.valueTextStyle})
      : super(key: key);
  final FindIdController findIdController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: supportUI.resHeight(12)),
      child: Center(
        child: Obx((){
          return Column(
            children: [
              commonUI.textForm(
                  Color(findIdController.nameColor.value),
                  TextFormField(
                    cursorColor: jakomoColor.silver,
                    style: valueTextStyle,
                    keyboardType: TextInputType.name,
                    onChanged: (String? value){
                      findIdController.validateName(value);
                    },

                    decoration: InputDecoration(
                      labelText: '이름',
                      labelStyle: TextStyle(
                          color: Color(findIdController.nameLabelColor.value),
                          fontSize: supportUI.resFontSize(14),
                          fontFamily: supportUI.fontNanum('r')),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  )),
              findIdController.nameError.value != ''
                  ? commonUI.errorGuide(findIdController.nameError.value)
                  : Container()
            ],
          );
        }),
      ),
    );
  }
}
