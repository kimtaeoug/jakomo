import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/BLE/ble_controller.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_ble_connection_container.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_ble_connection_switch.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class JakomoBLEConnection extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  JakomoBLEConnection({Key? key, required this.supportUI, required this.jakomoColor}):super(key: key);
  final BLEController bleController = Get.find(); 
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return bleController.connection.value?
          JakomoBLEConnectionContainer(supportUI: supportUI, jakomoColor: jakomoColor):
          JakomoBLEConnectionSwitch(supportUI: supportUI, jakomoColor: jakomoColor);
    });
  }
}