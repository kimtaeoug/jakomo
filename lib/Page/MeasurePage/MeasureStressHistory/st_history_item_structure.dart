import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureStressHistory/st_history_controller.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureStressHistory/st_history_item.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureStressHistory/st_model.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';


class STHistoryItemStructure extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final Map<DateTime, List<STModel>> data;
  final CommonUI commonUI;

  STHistoryItemStructure({Key? key,
    required this.supportUI,
    required this.jakomoColor,
    required this.data,
    required this.commonUI
  })
      : super(key: key);
  final STHistoryController historyController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: supportUI.deviceWidth,
      child: Obx(() {
        RxInt length = 0.obs;
        length.value = historyController
            .getData(
            data,
            DateTime.fromMillisecondsSinceEpoch(
                historyController.date.value))
            .length;
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: length!=0?List.generate(
              historyController
                  .getData(
                  data,
                  DateTime.fromMillisecondsSinceEpoch(
                      historyController.date.value))
                  .length,
                  (index) =>
                  STHistoryItem(
                    supportUI: supportUI,
                    jakomoColor: jakomoColor,
                    stModel: historyController.getData(
                        data,
                        DateTime.fromMillisecondsSinceEpoch(
                            historyController.date.value))[index],
                    commonUI: commonUI,)):
          [
            historyController.sameDay(
                DateTime.fromMillisecondsSinceEpoch(
                    historyController.date.value),
                DateTime.now())
                ? commonUI.noHistory()
                : Container()
          ],
        );
      }),
    );
  }
}
