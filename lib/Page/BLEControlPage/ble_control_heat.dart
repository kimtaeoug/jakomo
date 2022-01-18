import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/BLE/ble_controller.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'ble_navigation_controller.dart';

class BLEControlHeat extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  BLEControlHeat({Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);
  late final TextStyle _titleTextStyle2 = TextStyle(
      color: jakomoColor.black,
      fontSize: supportUI.resFontSize(16),
      fontFamily: supportUI.fontNanum('eb'),
      fontWeight: FontWeight.bold);

  final BLENavigationController bleNavigationController = Get.find();
  final BLEController bleController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: supportUI.resWidth(80)),
      child: Center(
        child: Obx((){
          return Container(
            width: supportUI.deviceWidth * 5 / 6 ,
            height: bleNavigationController.heatOn.value
                ? supportUI.resHeight(112)
                : supportUI.resWidth(64) ,
            decoration: BoxDecoration(
                border: Border.all(color: jakomoColor.gallery),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                color: jakomoColor.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: supportUI.deviceWidth * 5 / 6 - 2 - supportUI.resWidth(36),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '온열 모드',
                        style: _titleTextStyle2,
                      ),
                      _bleHeatSwitch(),
                    ],
                  ),
                ),
                SizedBox(
                  width: supportUI.deviceWidth * 5 / 6 - 2 - supportUI.resWidth(36),
                  child: bleNavigationController.heatOn.value
                      ? Padding(
                    padding: EdgeInsets.only(top: supportUI.resWidth(14)),
                    child: _settingHeat(),
                  )
                      : Container(),
                )
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _bleHeatSwitch() {
    return Obx(() {
      return GestureDetector(
        onTap: () {
          bleNavigationController.heatOn.value =
              !bleNavigationController.heatOn.value;
          if(bleNavigationController.heatOn.value){
            bleController.controlDevice('heat', 0);
          }else{
            bleController.controlDevice('heat', 1);
          }
        },
        child: Container(
          width: supportUI.resWidth(40),
          height: supportUI.resWidth(24),
          decoration: BoxDecoration(
              color: bleNavigationController.heatOn.value
                  ? jakomoColor.pistachio
                  : jakomoColor.silver,
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          child: Center(
            child: SizedBox(
              width: supportUI.resWidth(32),
              height: supportUI.resWidth(16),
              child: AnimatedAlign(
                duration: const Duration(milliseconds: 300),
                alignment: bleNavigationController.heatOn.value
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

  late final TextStyle _settingHeatTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontSize: supportUI.resFontSize(13),
      fontFamily: supportUI.fontNanum('b'),
      fontWeight: FontWeight.w600);

  Widget _settingHeat() {
    return Obx(() {
      return SizedBox(
        width: supportUI.deviceWidth * 5 / 6 ,
        height: supportUI.resWidth(40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: supportUI.resWidth(40),
              child: Center(
                child: Text(
                  '온도 설정',
                  style: _settingHeatTextStyle,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    bleNavigationController.heatLevel.value = 1;
                    bleController.controlDevice('heat', 1);
                  },
                  child: bleNavigationController.heatLevel.value == 1
                      ? _onHeatItem(36)
                      : _offHeatItem(36),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: supportUI.resWidth(8)),
                  child:GestureDetector(
                    onTap: () {
                      bleNavigationController.heatLevel.value = 2;
                      bleController.controlDevice('heat', 2);
                    },
                    child: bleNavigationController.heatLevel.value == 2
                        ? _onHeatItem(38)
                        : _offHeatItem(38),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    bleNavigationController.heatLevel.value = 3;
                    bleController.controlDevice('heat', 3);
                  },
                  child: bleNavigationController.heatLevel.value == 3
                      ? _onHeatItem(40)
                      : _offHeatItem(40),
                )
              ],
            )
          ],
        ),
      );
    });
  }

  late final TextStyle _settingHeatItemTextStyle = TextStyle(
      fontWeight: FontWeight.w900,
      fontFamily: supportUI.fontPoppings('bold'),
      fontSize: supportUI.resFontSize(12),
      color: jakomoColor.boulder);
  late final TextStyle _settingHeatItemTextStyle2 = TextStyle(
      fontWeight: FontWeight.w900,
      fontFamily: supportUI.fontPoppings('bold'),
      fontSize: supportUI.resFontSize(12),
      color: jakomoColor.white);

  Widget _onHeatItem(int level) {
    return Container(
      width: supportUI.resWidth(48),
      height: supportUI.resWidth(40),
      decoration: BoxDecoration(
          color: jakomoColor.pistachio,
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Center(
        child: Text(
          '$level°C',
          style: _settingHeatItemTextStyle2,
        ),
      ),
    );
  }

  Widget _offHeatItem(int level) {
    return Container(
      width: supportUI.resWidth(48) ,
      height: supportUI.resWidth(40) ,
      decoration: BoxDecoration(
        border: Border.all(color: jakomoColor.silver),
          color: jakomoColor.white,
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Center(
        child: Text(
          '$level°C',
          style: _settingHeatItemTextStyle,
        ),
      ),
    );
  }
}
