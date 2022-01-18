import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureBPHistory/bp_model.dart';


class BPHistoryController extends GetxController {
  final DateTime now = DateTime.now();
  RxInt idx = 0.obs;
  RxInt date = 0.obs;

  RxList<DateTime> dateList = <DateTime>[].obs;

  @override
  void onInit() {
    super.onInit();
    date.value = DateTime(now.year, now.month, now.day).millisecondsSinceEpoch;

    int moreDayIdx = 1;
    int beforeDayIdx = 7;
    for (int i = 0; i < 10; i++) {
      if (i < 8) {
        dateList.add(DateTime(
            now.subtract(Duration(days: beforeDayIdx)).year,
            now.subtract(Duration(days: beforeDayIdx)).month,
            now.subtract(Duration(days: beforeDayIdx)).day));
        beforeDayIdx -= 1;
      } else {
        dateList.add(DateTime(
            now.add(Duration(days: moreDayIdx)).year,
            now.add(Duration(days: moreDayIdx)).month,
            now.add(Duration(days: moreDayIdx)).day));
        moreDayIdx += 1;
      }
    }
    dateList.refresh();
  }

  int convertAgoDay(int input) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(input);
    return dateTime.subtract(const Duration(days: 1)).millisecondsSinceEpoch;
  }

  int convertNextDay(int input) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(input);
    DateTime nextDay = dateTime.add(const Duration(days: 1));
    return nextDay.millisecondsSinceEpoch;
  }

  void dateListAgoDay() {
    for (int idx = 0; idx < 10; idx++) {
      dateList[idx] = dateList[idx].subtract(const Duration(days: 1));
    }
    dateList.refresh();
  }

  void dateListNextDay() {
    for (int idx = 0; idx < 10; idx++) {
      dateList[idx] = dateList[idx].add(const Duration(days: 1));
    }
    dateList.refresh();
  }

  String convertToYM(int input) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(input);
    return '${dateTime.year}.${twoDigits(dateTime.month)}';
  }
  String twoDigits(int n) => n >= 10 ? '$n' : '0$n';

  List<BPModel> getData(Map<DateTime, List<BPModel>> dataMap, DateTime date) {
    for (DateTime key in dataMap.keys) {
      if (key == date) {
        if (dataMap[key] != null) {
          return dataMap[key]!;
        } else {
          return [];
        }
      }
    }
    return [];
  }

  //날짜(일) 별로 parsing
  Map<DateTime, List<BPModel>> parsingData(List<BPModel> dataList) {
    Map<DateTime, List<BPModel>> parsedData = {};
    int idx = 0;
    late DateTime standardDate;
    late DateTime updateDate;
    late int year;
    late int month;
    late int day;
    for (BPModel data in dataList) {
      DateTime date = data.date;
      year = date.year;
      month = date.month;
      day = date.day;
      if (idx == 0) {
        standardDate = DateTime(year, month, day);
        updateDate = DateTime(year, month, day);
        parsedData[standardDate] = [];
        if (parsedData[standardDate] != null) {
          parsedData[standardDate]!.add(data);
        } else {
          print('null occur');
          return {};
        }
      } else {
        updateDate = DateTime(year, month, day);
        if(sameDay(standardDate, updateDate)){
          parsedData[standardDate]!.add(data);
        }else{
          standardDate = updateDate;
          parsedData[standardDate] = [];
          if(parsedData[standardDate]!=null){
            parsedData[standardDate]!.add(data);
          }else{
            return {};
          }
        }
      }
      idx += 1;
    }

    return parsedData;
  }
  bool sameDay(DateTime date, DateTime date2){
    if(date.year == date2.year){
      if(date.month == date2.month){
        if(date.day == date2.day){
          return true;
        }
      }
    }
    return false;
  }

  double averageS(List<BPModel> dataList){
    int idx = 0;
    double systolicResult = 0;
    double sysAvg = 0;
    for (BPModel data in dataList) {
      systolicResult += data.systolic;
      idx += 1;
    }
    if(systolicResult != 0){
      sysAvg = systolicResult/idx;
    }
    return sysAvg;
  }
  double averateD(List<BPModel> dataList){
    int idx = 0;
    double diastolicResult = 0;
    double diaAvg = 0;
    for (BPModel data in dataList) {
      diastolicResult += data.diastolic;
      idx += 1;
    }
    if(diastolicResult != 0){
      diaAvg = diastolicResult/idx;
    }
    return diaAvg;
  }

  bool isToday(DateTime input) {
    if(input.year == now.year){
      if(input.month == now.month){
        if(input.day == now.day){
          return true;
        }
      }
    }
    return false;
  }
}
