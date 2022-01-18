import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_bottomsheet.dart';
import 'package:jakomo_recliner/Page/HomePage/JakomoUsefulInfo/jakomo_useful_info.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureHistoryItem/measure_history_item.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureHistoryItem/measure_history_item_model.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureResultPage/measure_result_controller.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureResultPage/measure_result_title.dart';
import 'package:jakomo_recliner/Routes/jakomo_routes.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class MeasureResultStructure extends StatefulWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final MeasureHistoryItemModel measureHistoryItemModel;
  MeasureResultStructure(
      {Key? key, required this.supportUI, required this.jakomoColor, required this.measureHistoryItemModel})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _MeasureResultStructure();
}

class _MeasureResultStructure extends State<MeasureResultStructure> {
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  late final MeasureHistoryItemModel measureHistoryItemModel = widget.measureHistoryItemModel;
  late final CommonUI commonUI = CommonUI(supportUI: supportUI, jakomoColor: jakomoColor);
  late final JakomoBottomSheet jakomoBottomSheet = JakomoBottomSheet(supportUI: supportUI, jakomoColor: jakomoColor);
  final MeasureResultController measureResultController = Get.find();
  late final ScrollController scrollController;
  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      measureResultController.scrollOffset.value = scrollController.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: supportUI.deviceWidth,
      height: supportUI.deviceHeight,
      child: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: supportUI.deviceWidth,
              height:
                  supportUI.resHeight(254) - supportUI.resHeight(60),
              color: jakomoColor.transperent,
            ),
            Container(
              width: supportUI.deviceWidth,
              height: supportUI.resHeight(60),
              decoration: BoxDecoration(
                  color: jakomoColor.white,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(15)),
                  border: Border.all(color: jakomoColor.transperent)),
            ),
            Container(
              width: supportUI.deviceWidth,
              decoration: BoxDecoration(
                color: jakomoColor.white,
                border: Border.all(color: jakomoColor.transperent)
              ),
              child: Center(
                child: MeasureResultTitle(
                    supportUI: supportUI, jakomoColor: jakomoColor),
              ),
            ),
            Container(
              width: supportUI.deviceWidth,
              decoration: BoxDecoration(
                color: jakomoColor.white,
                border: Border.all(color: jakomoColor.transperent)
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: supportUI.resHeight(32),
                      bottom: supportUI.resHeight(72)),
                  child: SizedBox(
                    width: supportUI.deviceWidth * 5 / 6,
                    height: supportUI.resHeight(400),
                    child: MeasureHistoryItem(
                      supportUI: supportUI,
                      jakomoColor: jakomoColor,
                      measureHistoryItemModel: measureHistoryItemModel,
                      commonUI: commonUI,),
                  ),
                ),
              ),
            ),
            Container(
              width: supportUI.deviceWidth,
              color: jakomoColor.white,
              child: Padding(
                padding: EdgeInsets.only(bottom: supportUI.resHeight(76)),
                child: JakomoUsefulInfo(
                    supportUI: supportUI, jakomoColor: jakomoColor),
              ),
            ),
            Container(
              width: supportUI.deviceWidth,
              color: jakomoColor.white,
              child: Padding(
                padding: EdgeInsets.only(bottom: supportUI.resHeight(25)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => jakomoBottomSheet.showMeasureGuide(context),
                        child: commonUI.concreteButton('재측정하기'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: supportUI.resWidth(8)),
                        child: GestureDetector(
                          onTap: () => Get.toNamed(JakomoRoutes.careHistory),
                          child: commonUI.pistachioSmallButton('측정 기록 보기'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

