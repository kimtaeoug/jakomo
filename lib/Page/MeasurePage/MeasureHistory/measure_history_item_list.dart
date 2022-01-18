import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/HomePage/JakomoEvent/jakomo_event.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureHistory/measure_history_conroller.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureHistoryItem/measure_history_item.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureHistoryItem/measure_history_item_model.dart';
import 'package:jakomo_recliner/Page/MeasurePage/measure_no_data.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class MeasureHistoryItemList extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final List<MeasureHistoryItemModel> dataList;
  final CommonUI commonUI;
  MeasureHistoryItemList(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.dataList,
      required this.commonUI
      })
      : super(key: key);

  final MeasureHistoryController measureHistoryController = Get.find();

  @override
  Widget build(BuildContext context) {
    if(dataList.isNotEmpty){
      return Obx(() {
        measureHistoryController.parsingData(
            measureHistoryController.date.value, dataList);
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: measureHistoryController.itemList.length > 3
              ? List.generate(measureHistoryController.itemList.length, (index) {
            if (index < 2) {
              return Padding(
                padding: EdgeInsets.only(bottom: supportUI.resHeight(20)),
                child: MeasureHistoryItem(
                  supportUI: supportUI,
                  jakomoColor: jakomoColor,
                  measureHistoryItemModel:
                  measureHistoryController.itemList[index], commonUI: commonUI,),
              );
            } else if (index == 2) {
              return JakomoEvent(
                  supportUI: supportUI, jakomoColor: jakomoColor);
            } else {
              return Padding(
                padding: EdgeInsets.only(bottom: supportUI.resHeight(20)),
                child: MeasureHistoryItem(
                  supportUI: supportUI,
                  jakomoColor: jakomoColor,
                  measureHistoryItemModel:
                  measureHistoryController.itemList[index-1], commonUI: commonUI,),
              );
            }
          })
              : List.generate(
              measureHistoryController.itemList.length,
                  (index) => Padding(
                padding: EdgeInsets.only(bottom: supportUI.resHeight(20)),
                child: MeasureHistoryItem(
                  supportUI: supportUI,
                  jakomoColor: jakomoColor,
                  measureHistoryItemModel:
                  measureHistoryController.itemList[index], commonUI: commonUI,),
              )),
        );
      });
    }else{
      return MeasureNoData(supportUI: supportUI, jakomoColor: jakomoColor);
    }
  }
}
