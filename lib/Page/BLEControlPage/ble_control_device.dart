import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/BLE/ble_controller.dart';
import 'package:jakomo_recliner/Page/BLEControlPage/ble_control_device_item.dart';
import 'package:jakomo_recliner/Page/BLEControlPage/ble_control_heat.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class BLEControlDevice extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  BLEControlDevice(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);
  late final TextStyle _titleTextStyle1 = TextStyle(
      color: jakomoColor.black,
      fontSize: supportUI.resFontSize(13),
      fontFamily: supportUI.fontNanum('b'),
      fontWeight: FontWeight.w900);
  late final TextStyle _itemTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: supportUI.fontNanum('b'),
      fontSize: supportUI.resFontSize(10),
      color: jakomoColor.boulder);
  final BLEController bleController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: supportUI.deviceWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: supportUI.resWidth(25), bottom: supportUI.resWidth(12)),
            child: Center(
              child: Container(
                width: supportUI.deviceWidth * 5 / 6,
                height: supportUI.resWidth(152) ,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    border: Border.all(color: jakomoColor.gallery),
                    color: jakomoColor.white),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: supportUI.resWidth(16), right: supportUI.resWidth(11)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: supportUI.resWidth(8)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: supportUI.resWidth(52),
                                    child: Center(
                                      child: Text(
                                        '등받이',
                                        style: _titleTextStyle1,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: supportUI.resWidth(20),
                                        right: supportUI.resWidth(8)),
                                    child: GestureDetector(
                                      onTapDown : (TapDownDetails detail){
                                        bleController.controlDevice('backBoard', 1);
                                      },
                                      onTapUp: (TapUpDetails detail){
                                        bleController.controlDevice('backBoard', 0);
                                      },
                                      child: BLEControlDeviceItem(
                                        supportUI: supportUI,
                                        jakomoColor: jakomoColor,
                                        itemTextStyle: _itemTextStyle,
                                        img: 'left_arrow_icon',
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTapDown: (TapDownDetails detail){
                                      bleController.controlDevice('backBoard', 2);
                                    },
                                    onTapUp: (TapUpDetails detail){
                                      bleController.controlDevice('backBoard', 0);
                                    },
                                    child: BLEControlDeviceItem(
                                        supportUI: supportUI,
                                        jakomoColor: jakomoColor,
                                        itemTextStyle: _itemTextStyle,
                                        img: 'right_arrow_icon',
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: supportUI.resWidth(52),
                                  child: Center(
                                    child: Text(
                                      '발받침',
                                      style: _titleTextStyle1,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: supportUI.resWidth(20),
                                      right: supportUI.resWidth(8)),
                                  child: GestureDetector(
                                    onTapDown: (TapDownDetails detail){
                                      bleController.controlDevice('footBoard', 1);
                                    },
                                    onTapUp: (TapUpDetails detail){
                                      bleController.controlDevice('footBoard', 0);
                                    },
                                    child: BLEControlDeviceItem(
                                        supportUI: supportUI,
                                        jakomoColor: jakomoColor,
                                        itemTextStyle: _itemTextStyle,
                                        img: 'left_arrow_icon',
                                        ),
                                  ),
                                ),
                                GestureDetector(
                                  onTapUp: (TapUpDetails detail){
                                    bleController.controlDevice('footBoard', 0);
                                  },
                                  onTapDown: (TapDownDetails detail){
                                    bleController.controlDevice('footBoard', 2);
                                  },
                                  child: BLEControlDeviceItem(
                                      supportUI: supportUI,
                                      jakomoColor: jakomoColor,
                                      itemTextStyle: _itemTextStyle,
                                      img: 'right_arrow_icon',
                                      ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: supportUI.resWidth(16)),
                        child: Container(
                          width: supportUI.resWidth(62) ,
                          height: supportUI.resWidth(112) ,
                          decoration: BoxDecoration(
                              color: jakomoColor.alabaster,
                              borderRadius: const BorderRadius.all(Radius.circular(14)),
                              border: Border.all(color: jakomoColor.alto),
                              boxShadow: [
                                BoxShadow(
                                  color: jakomoColor.grey.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 10,
                                ),
                              ]
                          ),
                          child: Center(
                            child: GestureDetector(
                              onTapDown: (TapDownDetails detail){
                                bleController.controlDevice('backBoard', 3);
                                bleController.controlDevice('footBoard', 3);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: supportUI.resWidth(24),
                                    height: supportUI.resWidth(24),
                                    child: const Icon(Icons.refresh),
                                  ),
                                  Text('리셋', style: _itemTextStyle,)
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          BLEControlHeat(supportUI: supportUI, jakomoColor: jakomoColor)
        ],
      ),
    );
  }
}
