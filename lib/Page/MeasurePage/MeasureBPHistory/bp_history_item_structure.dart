import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureBPHistory/bp_model.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'bp_history_controller.dart';
import 'bp_history_item.dart';

class BPHistoryItemStructure extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final Map<DateTime, List<BPModel>> data;
  final CommonUI commonUI;

  BPHistoryItemStructure(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.data,
      required this.commonUI})
      : super(key: key);
  final BPHistoryController historyController = Get.find();

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
          children: length.value != 0
              ? List.generate(
                  length.value,
                  (index) => BPHistoryItem(
                      supportUI: supportUI,
                      jakomoColor: jakomoColor,
                      hrModel: historyController.getData(
                          data,
                          DateTime.fromMillisecondsSinceEpoch(
                              historyController.date.value))[index]))
              : [
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
