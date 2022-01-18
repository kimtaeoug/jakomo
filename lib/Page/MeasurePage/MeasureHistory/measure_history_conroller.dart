import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureHistoryItem/measure_history_item_model.dart';

class MeasureHistoryController extends GetxController{
  RxInt date = 0.obs;
  RxList<MeasureHistoryItemModel> itemList = <MeasureHistoryItemModel>[].obs;
  @override
  void onInit(){
    super.onInit();
    DateTime now = DateTime.now();
    date.value = convertDateToInt(now);
  }
  int convertDateToInt(DateTime input) => input.millisecondsSinceEpoch;
  DateTime convertIntToDate(int input)=>DateTime.fromMillisecondsSinceEpoch(input);

  void parsingData(int input, List<MeasureHistoryItemModel> dataList){
    itemList.clear();
    DateTime standard = convertIntToDate(input);
    for(MeasureHistoryItemModel data in dataList){
      DateTime date = data.date;
      if(standard.year == date.year){
        if(standard.month == date.month){
          if(standard.day == date.day){
            itemList.add(data);
          }
        }
      }
    }
    itemList.refresh();
  }
  List<DateTime> findExistingData(List<MeasureHistoryItemModel> dataList){
    List<DateTime> result = [];
    late DateTime standardDate;
    late DateTime updateDate;
    int idx = 0;
    for(MeasureHistoryItemModel data in dataList){
      DateTime date = data.date;
      if(idx ==0){
        standardDate = DateTime(date.year, date.month, date.day);
        updateDate = DateTime(date.year, date.month, date.day);
        result.add(standardDate);
      }else{
        updateDate = DateTime(date.year, date.month, date.day);
        if(!sameDay(standardDate, updateDate)){
          standardDate = updateDate;
          result.add(standardDate);
        }
      }
      idx +=1;
    }
    return result;
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