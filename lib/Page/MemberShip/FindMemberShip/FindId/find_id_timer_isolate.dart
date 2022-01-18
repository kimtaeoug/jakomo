import 'dart:async';
import 'dart:isolate';

import 'package:get/get.dart';
import 'find_id_timer_controller.dart';


class FindIdTimerIsolate{
  late Isolate isolate;
  late ReceivePort receivePort;
  void setJakomoTimer()async{
    final FindIdTimerController controller = Get.find();
    receivePort = ReceivePort();
    isolate = await Isolate.spawn(startJakomoTimer, receivePort.sendPort);
    receivePort.listen((message) {
      if(message == 'end'){
        receivePort.close();
        isolate.kill(priority: Isolate.immediate);
      }else{
        controller.time.value = message;
      }
    });
  }
  static void startJakomoTimer(SendPort sendPort) async{
    DateTime now = DateTime.now();
    DateTime authTime = now.add(const Duration(minutes: 5));
    Timer.periodic(const Duration(seconds: 1), (timer) {
      DateTime standardNow = DateTime.now();
      int lastTime = authTime.difference(standardNow).inSeconds;
      if(lastTime == 0){
        sendPort.send('end');
        timer.cancel();
      }else{
        int rawMinute = lastTime ~/ 60;
        int rawSecond = lastTime - rawMinute*60;
        String minute = rawMinute>=10?'$rawMinute':'0$rawMinute';
        String second = rawSecond>=10?'$rawSecond':'0$rawSecond';
        sendPort.send('$minute:$second');
      }
    });
  }
  void killJakoTimer(){
    receivePort.close();
    isolate.kill(priority: Isolate.immediate);
  }
}