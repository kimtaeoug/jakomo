import 'package:get/get.dart';
import 'package:jakomo_recliner/Logger/logger_factory.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureBPHistory/bp_model.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureHeartRateHistory/hr_model.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureHistoryItem/measure_history_item_model.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureStressHistory/st_model.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureWeightHistory/we_model.dart';
import 'package:jakomo_recliner/ServerData/history_isolate.dart';

class HistoryController extends GetxController{
  final LoggerFactory loggerFactory = LoggerFactory();
  RxList<MeasureHistoryItemModel> dataList = <MeasureHistoryItemModel>[].obs;
  RxList<BPModel> bpDataList = <BPModel>[].obs;
  RxList<HRModel> hrDataList = <HRModel>[].obs;
  RxList<STModel> stDataList = <STModel>[].obs;
  RxList<WEModel> weDataList = <WEModel>[].obs;
  RxDouble measureCount = 0.0.obs;
  void initHistoryData(){
    final HistoryIsolate historyIsolate = HistoryIsolate();
    historyIsolate.requestHistoryData();
  }
  void calculateMeasureCount(){
    if(dataList.isNotEmpty){
      int idx = 0;
      late DateTime standard;
      for(MeasureHistoryItemModel data in dataList){
        if(idx == 0){
          standard = data.date;
          idx +=1;
        }else{
          if(!sameDay(standard, data.date)){
            standard = data.date;
            idx+=1;
          }
        }
      }
      measureCount.value = idx.toDouble();
    }
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
}