import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'bp_history_bar.dart';
import 'bp_history_controller.dart';
import 'bp_model.dart';

class BPGraph extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;
  final Map<DateTime, List<BPModel>> data;

  BPGraph(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.commonUI,
      required this.data})
      : super(key: key);
  final BPHistoryController historyController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: supportUI.deviceWidth,
      height: supportUI.resHeight(200),
      child: Obx(() {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BPHistoryBar(
                supportUI: supportUI,
                idx: 0,
                today: historyController.isToday(historyController.dateList[0]),
                jakomoColor: jakomoColor,
                date: historyController.dateList[0],
                systolic: historyController.averageS(historyController.getData(
                    data, historyController.dateList[0])),
                diastolic: historyController.averateD(historyController.getData(
                    data, historyController.dateList[0])),
              ),
              BPHistoryBar(
                supportUI: supportUI,
                idx: 1,
                today: historyController.isToday(historyController.dateList[1]),
                jakomoColor: jakomoColor,
                date: historyController.dateList[1],
                systolic: historyController.averageS(historyController.getData(
                    data, historyController.dateList[1])),
                diastolic: historyController.averateD(historyController.getData(
                    data, historyController.dateList[1])),
              ),
              BPHistoryBar(
                supportUI: supportUI,
                idx: 2,
                today: historyController.isToday(historyController.dateList[2]),
                jakomoColor: jakomoColor,
                date: historyController.dateList[2],
                systolic: historyController.averageS(historyController.getData(
                    data, historyController.dateList[2])),
                diastolic: historyController.averateD(historyController.getData(
                    data, historyController.dateList[2])),
              ),
              BPHistoryBar(
                supportUI: supportUI,
                idx: 3,
                today: historyController.isToday(historyController.dateList[3]),
                jakomoColor: jakomoColor,
                date: historyController.dateList[3],
                systolic: historyController.averageS(historyController.getData(
                    data, historyController.dateList[3])),
                diastolic: historyController.averateD(historyController.getData(
                    data, historyController.dateList[3])),
              ),
              BPHistoryBar(
                supportUI: supportUI,
                idx: 4,
                today: historyController.isToday(historyController.dateList[4]),
                jakomoColor: jakomoColor,
                date: historyController.dateList[4],
                systolic: historyController.averageS(historyController.getData(
                    data, historyController.dateList[4])),
                diastolic: historyController.averateD(historyController.getData(
                    data, historyController.dateList[4])),
              ),
              BPHistoryBar(
                supportUI: supportUI,
                idx: 5,
                today: historyController.isToday(historyController.dateList[5]),
                jakomoColor: jakomoColor,
                date: historyController.dateList[5],
                systolic: historyController.averageS(historyController.getData(
                    data, historyController.dateList[5])),
                diastolic: historyController.averateD(historyController.getData(
                    data, historyController.dateList[5])),
              ),
              BPHistoryBar(
                supportUI: supportUI,
                idx: 6,
                today: historyController.isToday(historyController.dateList[6]),
                jakomoColor: jakomoColor,
                date: historyController.dateList[6],
                systolic: historyController.averageS(historyController.getData(
                    data, historyController.dateList[6])),
                diastolic: historyController.averateD(historyController.getData(
                    data, historyController.dateList[6])),
              ),
              BPHistoryBar(
                supportUI: supportUI,
                idx: 7,
                today: historyController.isToday(historyController.dateList[7]),
                jakomoColor: jakomoColor,
                date: historyController.dateList[7],
                systolic: historyController.averageS(historyController.getData(
                    data, historyController.dateList[7])),
                diastolic: historyController.averateD(historyController.getData(
                    data, historyController.dateList[7])),
              ),
              BPHistoryBar(
                supportUI: supportUI,
                idx: 8,
                today: historyController.isToday(historyController.dateList[8]),
                jakomoColor: jakomoColor,
                date: historyController.dateList[8],
                systolic: historyController.averageS(historyController.getData(
                    data, historyController.dateList[8])),
                diastolic: historyController.averateD(historyController.getData(
                    data, historyController.dateList[8])),
              ),
              BPHistoryBar(
                supportUI: supportUI,
                idx: 9,
                today: historyController.isToday(historyController.dateList[9]),
                jakomoColor: jakomoColor,
                date: historyController.dateList[9],
                systolic: historyController.averageS(historyController.getData(
                    data, historyController.dateList[9])),
                diastolic: historyController.averateD(historyController.getData(
                    data, historyController.dateList[9])),
              )
            ],
          ),
        );
      }),
    );
  }
}
