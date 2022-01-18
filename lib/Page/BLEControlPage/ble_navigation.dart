import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/BLEControlPage/ble_control_device.dart';
import 'package:jakomo_recliner/Page/BLEControlPage/ble_control_shake.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'ble_navigation_controller.dart';

class BLENavigation extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  BLENavigation({Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);
  late final TextStyle _titleTextStyle = TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: supportUI.fontNanum('eb'),
      color: jakomoColor.black);
  late final TextStyle _inactivateTextStyle = TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: supportUI.fontNanum('eb'),
      color: jakomoColor.mineShaft.withOpacity(0.2));
  late final Size _textSize1 = supportUI.getTextSize('컨트롤', _titleTextStyle);
  late final Size _textSize2 = supportUI.getTextSize('흔들 모드 ', _titleTextStyle);
  final BLENavigationController bleNavigationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.deviceWidth,
      color: jakomoColor.alto.withOpacity(0.2),
      child: Obx(() {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: supportUI.deviceWidth,
              color: jakomoColor.white,
              child: Padding(
                padding: EdgeInsets.only(left: supportUI.commonLeft()),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: supportUI.resWidth(16)),
                          child: GestureDetector(
                            onTap: () {
                              bleNavigationController.pageIdx.value = 1;
                            },
                            child: Text(
                              '컨트롤',
                              style: bleNavigationController.pageIdx.value == 1
                                  ? _titleTextStyle
                                  : _inactivateTextStyle,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            bleNavigationController.pageIdx.value = 2;
                          },
                          child: Text(
                            '흔들 모드',
                            style: bleNavigationController.pageIdx.value == 2
                                ? _titleTextStyle
                                : _inactivateTextStyle,
                          ),
                        )
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: SizedBox(
                        width: _textSize1.width +
                            _textSize2.width +
                            supportUI.resWidth(17),
                        height: supportUI.resHeight(2),
                        child: AnimatedAlign(
                          alignment: bleNavigationController.pageIdx.value == 1
                              ? AlignmentDirectional.centerStart
                              : AlignmentDirectional.centerEnd,
                          duration: const Duration(milliseconds: 300),
                          child: Container(
                            width: bleNavigationController.pageIdx.value == 1
                                ? _textSize1.width
                                : _textSize2.width,
                            height: supportUI.resHeight(2),
                            color: jakomoColor.pistachio,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            bleNavigationController.pageIdx.value == 1
                ? BLEControlDevice(
                    supportUI: supportUI, jakomoColor: jakomoColor)
                : BLEControlShake(
                    supportUI: supportUI, jakomoColor: jakomoColor)
          ],
        );
      }),
    );
  }
}
