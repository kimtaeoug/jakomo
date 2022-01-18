import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/BLE/ble_controller.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureHistoryItem/measure_history_item_model.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureResultPage/measure_result_background.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureResultPage/measure_result_close_button.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureResultPage/measure_result_controller.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureResultPage/measure_result_structure.dart';
import 'package:jakomo_recliner/Routes/jakomo_routes.dart';
import 'package:jakomo_recliner/ServerData/history_controller.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class MeasureResultPage extends StatelessWidget {
  final SupportUI supportUI = SupportUI();
  final JakomoColor jakomoColor = JakomoColor();

  MeasureResultPage({Key? key}) : super(key: key);
  final HistoryController historyController = Get.find();
  final BLEController bleController = Get.find();
  final MeasureResultController measureResultController = Get.find();
  @override
  Widget build(BuildContext context) {
    bleController.measureStop();
    return SafeArea(
      child: Scaffold(
        backgroundColor: jakomoColor.white,
        body: WillPopScope(
          onWillPop: () {
            Get.toNamed(JakomoRoutes.care, arguments: false);
            return Future(() => false);
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Align(
                alignment: AlignmentDirectional.topCenter,
                child: MeasureResultBackGround(
                    supportUI: supportUI, jakomoColor: jakomoColor),
              ),
              Obx((){
                return MeasureResultStructure(
                  supportUI: supportUI,
                  jakomoColor: jakomoColor,
                  measureHistoryItemModel: historyController.dataList.last,
                );
              }),
              Obx((){
                return measureResultController.scrollOffset.value > 50?
                    Container():MeasureResultCloseButton(supportUI: supportUI, jakomoColor: jakomoColor);
              })
            ],
          ),
        ),
      ),
    );
  }
}
