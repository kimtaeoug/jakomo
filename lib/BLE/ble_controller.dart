import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/BLE/ble_protocol.dart';
import 'package:jakomo_recliner/Logger/logger_factory.dart';
import 'package:jakomo_recliner/MeasureAPI/measure_api.dart';

import 'measure_isolate.dart';

class BLEController extends GetxController{
  final LoggerFactory _log = LoggerFactory();
  final BLEProtocol _bleProtocol = BLEProtocol();

  late BluetoothDevice _bluetoothDevice;
  late BluetoothCharacteristic readCharacteristic;
  late BluetoothCharacteristic writeCharacteristic;
  late StreamSubscription<List<int>> _bleStreamSubscription;

  RxBool isShowBottomSheet = false.obs;
  RxBool connection = false.obs;

  void observeBLEState(){
    try{
      _bluetoothDevice.state.listen((event) {
        if(event == BluetoothDeviceState.connected){
          connection.value = true;
        }else if(event == BluetoothDeviceState.disconnected){
          connection.value = false;
        }
      });
    }catch(e){
      _log.logE('$e');
    }
  }

  Future<void> connectBLE(BluetoothDevice input)async{
    try{
      _bluetoothDevice = input;
      _bluetoothDevice.connect().then((_){
        matchServiceCharacteristic(_bluetoothDevice).then((_) => observeBLEState());
      });
    }catch(e){
      _log.logE('$e');
    }
  }
  Future<void> matchServiceCharacteristic(BluetoothDevice input) async{
    try{
      List<BluetoothService> services = await input.discoverServices();
      for (BluetoothService service in services) {
        if(service.uuid.toString() == _bleProtocol.serviceUUID){
          for(BluetoothCharacteristic characteristic in service.characteristics){
            if(characteristic.uuid.toString() == _bleProtocol.writeCharacteristicUUID){
              writeCharacteristic = characteristic;
            }else if(characteristic.uuid.toString() == _bleProtocol.readCharacteristicUUID){
              readCharacteristic = characteristic;
              await setNotification(readCharacteristic);
            }
          }
        }
      }
    }catch(e){
      _log.logE('$e');
    }
  }
  Future<void> setNotification(BluetoothCharacteristic characteristic)async{
    try{
      await characteristic.setNotifyValue(!characteristic.isNotifying);
      await characteristic.read();
      initListenDataFromDevice();
    }catch(e){
      _log.logE('$e');
    }
  }
  void initListenDataFromDevice()async{
    try{
      _bleStreamSubscription = readCharacteristic.value.listen((event) {
        // _log.logI('event : $event');
      });
      _log.logI('BLE StreamSubscription is open');
    }catch(e){
      _log.logE('$e');
    }
  }

  void measureStart() async{
    try{
      final MeasureIsolate measureIsolate = MeasureIsolate();
      measureIsolate.calculateMeasure(MeasureAPI(
          Dio(
              BaseOptions(
                  contentType: "application/json",
                  connectTimeout: 100 * 1000,
                  receiveTimeout: 100 * 1000
              )
          )
      ));
    }catch(e){
      _log.logE('$e');
    }
  }
  void measureStop()async{
    try{
      writeCharacteristic.write(_bleProtocol.measureEnd, withoutResponse: true);
    }catch(e){
      _log.logE('$e');
    }
  }
  void controlDevice(String controlName, int id){
    try{
      if(getProperProtocol(controlName, id).isNotEmpty){
        writeCharacteristic.write(getProperProtocol(controlName, id), withoutResponse: true);
        sleep(const Duration(milliseconds: 100));
      }else{
        _log.logW('controlDevice($controlName)\' is wrong');
        return;
      }
    }catch(e){
      _log.logE('$e');
      return;
    }
  }
  List<int> getProperProtocol(String controlName, int id){
    List<int> result = [];
    switch(controlName){
      case 'backBoard':
        switch(id){
          case 0:
            result = _bleProtocol.moveBackBoardOff;
            break;
          case 1:
            result = _bleProtocol.moveBackBoardFront;
            break;
          case 2:
            result = _bleProtocol.moveBackBoardBack;
            break;
          case 3:
            result = _bleProtocol.moveBackBoardOrigin;
            break;
        }
        break;
      case 'footBoard':
        switch(id){
          case 0:
            result = _bleProtocol.moveFootBoardOff;
            break;
          case 1:
            result = _bleProtocol.moveFootBoardFront;
            break;
          case 2:
            result = _bleProtocol.moveFootBoardBack;
            break;
          case 3:
            result = _bleProtocol.moveFootBoardOrigin;
            break;
        }
        break;
      case 'heat':
        switch(id){
          case 0:
            result = _bleProtocol.heatOff;
            break;
          case 1:
            result = _bleProtocol.heatLevel1;
            break;
          case 2:
            result = _bleProtocol.heatLevel2;
            break;
          case 3:
            result = _bleProtocol.heatLevel3;
            break;
        }
        break;
      case 'shake':
        switch(id){
          case 0:
            result = _bleProtocol.shakeOff;
            break;
          case 1:
            result = _bleProtocol.shakeLevel1;
            break;
          case 2:
            result = _bleProtocol.shakeLevel2;
            break;
          case 3:
            result = _bleProtocol.shakeLevel3;
            break;
        }
        break;
    }
    return result;
  }
}