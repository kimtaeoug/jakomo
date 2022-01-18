import 'dart:async';
import 'dart:isolate';

import 'package:get/get.dart';
import 'package:jakomo_recliner/BLE/ble_controller.dart';
import 'package:jakomo_recliner/BLE/ble_protocol.dart';
import 'package:jakomo_recliner/MeasureAPI/measure_api.dart';
import 'package:jakomo_recliner/MeasureAPI/measure_input_model.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureHistoryItem/measure_history_item_model.dart';
import 'package:jakomo_recliner/Routes/jakomo_routes.dart';
import 'package:jakomo_recliner/ServerData/history_controller.dart';

class MeasureIsolate {
  late Isolate _measureIsoalte;
  late ReceivePort _measureReceivePort;
  late StreamSubscription _streamSubscription;
  final BLEProtocol _bleProtocol = BLEProtocol();
  final BLEController _bleController = Get.find();
  final HistoryController historyController = Get.find();
  late MeasureHistoryItemModel measureHistoryItemModel;

  void calculateMeasure(MeasureAPI measureAPI) async {
    _measureReceivePort = ReceivePort();
    SendPort _sendPort = _measureReceivePort.sendPort;
    _measureIsoalte = await Isolate.spawn(calculateMeasureOnIsolate, _sendPort);
    try {
      _measureReceivePort.listen((data) async {
        if (data is SendPort) {
          await _bleController.writeCharacteristic
              .write(_bleProtocol.measureStart, withoutResponse: true)
              .then((_) {
            _streamSubscription =
                _bleController.readCharacteristic.value.listen((event) {
              data.send(event);
            });
          });
        } else {
          await _bleController.writeCharacteristic
              .write(_bleProtocol.measureEnd, withoutResponse: true);
          measureAPI
              .requestMeasureResult(MeasureInputModel(70, data.toString()))
              .then((value) {
            measureHistoryItemModel = MeasureHistoryItemModel(
                date: DateTime.fromMillisecondsSinceEpoch(value.recordedTime),
                heartRate: value.heartRate.toInt(),
                stress: value.stress.toInt(),
                systolic: value.systolic.toInt(),
                diastolic: value.diastolic.toInt(),
                weight: value.weight.toInt(),
                advice:
                    '과로에 의한 만성스트레스 상태로 보여집니다. 하루에 최소 2~3번 가벼운 산책이나 명상등의 휴식을 취하시기 바랍니다.');
            historyController.dataList.add(measureHistoryItemModel);
            historyController.dataList.refresh();
          });
          await _bleController.writeCharacteristic
              .write(_bleProtocol.measureEnd, withoutResponse: true);
          await _streamSubscription.cancel();
          _measureReceivePort.close();
          _measureIsoalte.kill(priority: Isolate.immediate);
        }
      });
    } catch (e) {
      Get.toNamed(JakomoRoutes.care, arguments: true);
      _measureReceivePort.close();
      _measureIsoalte.kill(priority: Isolate.immediate);
    }
  }

  static void calculateMeasureOnIsolate(SendPort sendPort) async {
    final ReceivePort isolateReceivePort = ReceivePort();
    final SendPort isolateSendPort = isolateReceivePort.sendPort;
    const double lPFCOEFFECG = 0.100;
    const double lPFCOEFFPPG = 0.300;
    sendPort.send(isolateSendPort);
    StringBuffer totalData = StringBuffer();
    double evenData = 0.0;
    double oddData = 0.0;
    int idx = 0;
    isolateReceivePort.listen((event) {
      for (int data in event) {
        if (idx % 2 == 0) {
          evenData = evenData - (lPFCOEFFECG * (evenData - data));
          totalData.write("$evenData ;");
        } else {
          oddData = oddData - (lPFCOEFFPPG * (oddData - data));
          totalData.write("$oddData; 157 \n");
        }
        idx += 1;
      }
    });
    Timer.periodic(const Duration(seconds: 90), (timer) {
      sendPort.send(totalData);
      isolateReceivePort.close();
      timer.cancel();
    });
  }
}
