import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/BLE/ble_controller.dart';
import 'package:jakomo_recliner/Page/BLEControlPage/ble_navigation_controller.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_bottomsheet.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class RestCareModeSwitch extends StatefulWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  const RestCareModeSwitch(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _RestCareModeSwitch();
}

class _RestCareModeSwitch extends State<RestCareModeSwitch> {
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;

  final BLEController bleController = Get.find();
  final BLENavigationController bleNavigationController = Get.find();
  late final JakomoBottomSheet jakomoBottomSheet = JakomoBottomSheet(supportUI: supportUI, jakomoColor: jakomoColor);
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return GestureDetector(
        onTap: (){
          if(bleController.connection.value == false){
            jakomoBottomSheet.showConnectionNeed(context);
          }else{
            if(bleNavigationController.shakeOn.value == false){
              jakomoBottomSheet.showShakeGuide(context);
            }else{
              bleNavigationController.shakeOn.value = false;
              bleController.controlDevice('shake', 1);
            }
          }
        },
        child: Container(
          width: supportUI.resWidth(40),
          height: supportUI.resWidth(24),
          decoration: BoxDecoration(
              color: bleNavigationController.shakeOn.value ? jakomoColor.pistachio : jakomoColor.silver,
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              border: Border.all(color: jakomoColor.gallery)
          ),
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
                      color: jakomoColor.white, shape: BoxShape.circle),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
