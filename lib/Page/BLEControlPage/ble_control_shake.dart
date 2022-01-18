import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/BLE/ble_controller.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_bottomsheet.dart';
import 'package:jakomo_recliner/Page/RestCarePage/RestCareMode/rest_care_guide_text.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'ble_navigation_controller.dart';

class BLEControlShake extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  BLEControlShake({Key? key, required this.supportUI, required this.jakomoColor}) :super(key: key);
  final BLENavigationController bleNavigationController = Get.find();

  late final TextStyle _titleTextStyle = TextStyle(
    fontSize: supportUI.resFontSize(16),
    color: jakomoColor.black,
    fontFamily: supportUI.fontNanum('eb'),
    fontWeight: FontWeight.bold
  );
  late final JakomoBottomSheet jakomoBottomSheet = JakomoBottomSheet(supportUI: supportUI, jakomoColor: jakomoColor);
  final BLEController bleController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: supportUI.deviceWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: supportUI.resWidth(30), bottom: supportUI.resWidth(16)),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    color: jakomoColor.gallery
                ),
                child: Container(
                  width: supportUI.deviceWidth*5/6,
                  height: supportUI.resWidth(64),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    color: jakomoColor.white
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: supportUI.resWidth(24)),
                        child: SizedBox(
                          height: supportUI.resWidth(24),
                          child: Center(
                            child: Text('흔들 모드', style: _titleTextStyle,),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: supportUI.resWidth(20)),
                        child: _bleShakeSwitch(context),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: RestCareGuideText(supportUI: supportUI, jakomoColor: jakomoColor,)
          )
        ],
      ),
    );
  }
  Widget _bleShakeSwitch(BuildContext context){
    return Obx((){
      return GestureDetector(
        onTap: (){
          if(bleNavigationController.shakeOn.value == false){
            jakomoBottomSheet.showShakeGuide(context);
          }else{
            bleNavigationController.shakeOn.value = false;
            bleController.controlDevice('shake', 1);
          }
        },
        child: Container(
          width: supportUI.resWidth(40),
          height: supportUI.resWidth(24),
          decoration: BoxDecoration(
              color: bleNavigationController.shakeOn.value
                  ? jakomoColor.pistachio
                  : jakomoColor.silver,
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          child: Center(
            child: SizedBox(
              width: supportUI.resWidth(32),
              height: supportUI.resWidth(16),
              child: AnimatedAlign(
                duration: const Duration(milliseconds: 300),
                alignment: bleNavigationController.shakeOn.value
                    ? AlignmentDirectional.centerEnd
                    : AlignmentDirectional.centerStart,
                child: Container(
                  width: supportUI.resWidth(16),
                  height: supportUI.resWidth(16),
                  decoration: BoxDecoration(
                      color: jakomoColor.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: jakomoColor.grey.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 10,
                          // offset: const Offset(4.0, 2.0)
                        ),
                      ]),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

}