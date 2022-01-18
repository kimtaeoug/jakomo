import 'dart:async';
import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureBPHistory/bp_model.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureHeartRateHistory/hr_model.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureHistoryItem/measure_history_item_model.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureStressHistory/st_model.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureWeightHistory/we_model.dart';
import 'package:jakomo_recliner/ServerData/history_client.dart';
import 'package:jakomo_recliner/ServerData/history_controller.dart';

import 'history_output_model.dart';

class HistoryIsolate {
  late Isolate _historyIsolate;
  late ReceivePort _historyPort;
  final HistoryController historyController = Get.find();

  void requestHistoryData() async {
    _historyPort = ReceivePort();
    _historyIsolate =
        await Isolate.spawn(requestHistoryDataOnIsolate, _historyPort.sendPort);
    _historyPort.listen((data) async {
      if (data != 'end') {
        historyController.dataList.add(data);
        historyController.dataList.refresh();
        historyController.bpDataList.add(BPModel(systolic: data.systolic, diastolic: data.diastolic, date: data.date));
        historyController.bpDataList.refresh();
        historyController.hrDataList.add(HRModel(heartRate: data.heartRate, date: data.date));
        historyController.hrDataList.refresh();
        historyController.stDataList.add(STModel(stress: data.stress, date: data.date));
        historyController.stDataList.refresh();
        historyController.weDataList.add(WEModel(weight: data.weight, date: data.date));
        historyController.weDataList.refresh();
      } else {
        _historyPort.close();
        _historyIsolate.kill(priority: Isolate.immediate);
      }
    });
  }

  static void requestHistoryDataOnIsolate(SendPort sendPort) async {
    final DateTime now = DateTime.now();
    await HistoryClient(Dio(BaseOptions(contentType: "application/json")))
        .getAllHistory(DateTime(0).millisecondsSinceEpoch,
            now.millisecondsSinceEpoch, "RAW")
        .then((result) {
      for (HistoryOutPutModel data in result) {
        sendPort.send(MeasureHistoryItemModel(
            date: DateTime.fromMillisecondsSinceEpoch(data.recordedTime),
            heartRate: data.heartRate.toInt(),
            stress: data.stress.toInt(),
            systolic: data.systolic.toInt(),
            diastolic: data.diastolic.toInt(),
            weight: data.weight.toInt(),
            advice:
                '과로에 의한 만성스트레스 상태로 보여집니다. 하루에 최소 2~3번 가벼운 산책이나 명상등의 휴식을 취하시기 바랍니다.'));
      }
    });
  }
}
