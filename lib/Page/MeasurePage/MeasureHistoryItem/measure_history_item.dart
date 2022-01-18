import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureHistoryItem/measure_history_item_advice.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureHistoryItem/measure_history_item_model.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureHistoryItem/measure_history_item_row.dart';
import 'package:jakomo_recliner/Routes/jakomo_routes.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class MeasureHistoryItem extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final MeasureHistoryItemModel measureHistoryItemModel;
  final CommonUI commonUI;
  MeasureHistoryItem(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.measureHistoryItemModel,
      required this.commonUI
      })
      : super(key: key);
  late final TextStyle _dateTextStyle = TextStyle(
      color: jakomoColor.yukonGold,
      fontSize: supportUI.resFontSize(13),
      fontFamily: supportUI.fontPoppings('semibold'),
      fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: jakomoColor.white,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(color: jakomoColor.boulder.withOpacity(0.2))),
      width: supportUI.deviceWidth * 5 / 6,
      height: supportUI.resHeight(400),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: supportUI.resHeight(20)),
            child: Center(
              child: SizedBox(
                width: supportUI.deviceWidth * 5 / 6 - supportUI.resWidth(40),
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    '${measureHistoryItemModel.date.year}.${supportUI.twoDigits(measureHistoryItemModel.date.month)}.${supportUI.twoDigits(measureHistoryItemModel.date.day)} ${supportUI.twoDigits(measureHistoryItemModel.date.hour)}:${supportUI.twoDigits(measureHistoryItemModel.date.minute)}',
                    style: _dateTextStyle,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () => Get.toNamed(JakomoRoutes.hrHistory),
              child: MeasureHistoryItemRow(
                  supportUI: supportUI,
                  jakomoColor: jakomoColor,
                  tag: 'heartRate',
                  measureHistoryItemModel: measureHistoryItemModel, commonUI: commonUI,),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () => Get.toNamed(JakomoRoutes.stHistory),
              child: MeasureHistoryItemRow(
                  supportUI: supportUI,
                  jakomoColor: jakomoColor,
                  tag: 'stress',
                  measureHistoryItemModel: measureHistoryItemModel, commonUI: commonUI,),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () => Get.toNamed(JakomoRoutes.bpHistory),
              child: MeasureHistoryItemRow(
                  supportUI: supportUI,
                  jakomoColor: jakomoColor,
                  tag: 'bloodRate',
                  measureHistoryItemModel: measureHistoryItemModel, commonUI: commonUI,),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () => Get.toNamed(JakomoRoutes.weHistory),
              child: MeasureHistoryItemRow(
                  supportUI: supportUI,
                  jakomoColor: jakomoColor,
                  tag: 'weight',
                  measureHistoryItemModel: measureHistoryItemModel, commonUI: commonUI,),
            ),
          ),
          Center(
            child: MeasureHistoryItemAdvice(
                supportUI: supportUI,
                jakomoColor: jakomoColor,
                advice: measureHistoryItemModel.advice),
          )
        ],
      ),
    );
  }
}
