import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/BottomNavigation/bottom_navigation_controller.dart';
import 'package:jakomo_recliner/Page/BottomNavigation/navigation_with_floating.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureHeartRateHistory/hr_date_ui.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureHeartRateHistory/hr_graph.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureHeartRateHistory/hr_history_item_structure.dart';
import 'package:jakomo_recliner/ServerData/history_controller.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'hr_history_controller.dart';
import 'hr_model.dart';

class HRHistoryPage extends StatefulWidget{
  final SupportUI supportUI = SupportUI();
  final JakomoColor jakomoColor = JakomoColor();
  HRHistoryPage({Key? key}) : super(key: key);

  final List<HRModel> hrList = [
    HRModel(heartRate: 64, date: DateTime(2021, 12, 16, 19)),
    HRModel(heartRate: 72, date: DateTime(2021, 12, 15, 7)),
    HRModel(heartRate: 68, date: DateTime(2021, 12, 15, 6)),
    HRModel(heartRate: 54, date: DateTime(2021, 12, 15, 3)),
    HRModel(heartRate: 48, date: DateTime(2021, 12, 15, 1)),
    HRModel(heartRate: 67, date: DateTime(2021, 12, 14, 3)),
    HRModel(heartRate: 72, date: DateTime(2021, 12, 14, 1)),
    HRModel(heartRate: 80, date: DateTime(2021, 12, 14, 0)),
    HRModel(heartRate: 90, date: DateTime(2021, 12, 12, 15)),
    HRModel(heartRate: 45, date: DateTime(2021, 12, 12, 12)),
    HRModel(heartRate: 32, date: DateTime(2021, 12, 12, 10)),
    HRModel(heartRate: 80, date: DateTime(2021, 12, 12, 5)),
    HRModel(heartRate: 43, date: DateTime(2021, 12, 12, 3)),
    HRModel(heartRate: 23, date: DateTime(2021, 12, 11, 5))
  ];
  @override
  State<StatefulWidget> createState() => _HRHistoryPage();

}

class _HRHistoryPage extends State<HRHistoryPage> {
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  late final CommonUI commonUI =
      CommonUI(supportUI: supportUI, jakomoColor: jakomoColor);
  final HRHistoryController historyController = Get.put(HRHistoryController());

  late final List<HRModel> hrList = widget.hrList;
  late Map<DateTime, List<HRModel>> dataList;

  final HistoryController serverHistoryController = Get.find();
  final BottomNavigationController bottomNavigationController = Get.find();
  late ScrollController scrollController;
  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if(scrollController.position.userScrollDirection == ScrollDirection.reverse){
        bottomNavigationController.scrollNow.value = false;
      }
    });
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      scrollController.position.isScrollingNotifier.addListener(() {
        if(!scrollController.position.isScrollingNotifier.value){
          bottomNavigationController.scrollNow.value = true;
        }
      });
    });
    super.initState();
  }
  @override
  void dispose(){
    scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: jakomoColor.white,
      body: WillPopScope(
        onWillPop: () {
          Get.back();
          return Future(() => false);
        },
        child: Stack(
          children: [
            SizedBox(
              width: supportUI.deviceWidth,
              height: supportUI.deviceHeight,
              child: SingleChildScrollView(
                controller: scrollController,
                scrollDirection: Axis.vertical,
                child: Obx((){
                  dataList = historyController.parsingData(
                      serverHistoryController.hrDataList.isNotEmpty
                          ? serverHistoryController.hrDataList
                          : hrList);
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: supportUI.resHeight(24)),
                        child: commonUI.pageTop('심박수', ''),
                      ),
                      HRDateUI(supportUI: supportUI, jakomoColor: jakomoColor),
                      HRGraph(
                          supportUI: supportUI,
                          jakomoColor: jakomoColor,
                          commonUI: commonUI,
                          data: dataList),
                      Padding(
                        padding: EdgeInsets.only(top: supportUI.resHeight(14)),
                        child: Container(
                          width: supportUI.deviceWidth,
                          height: supportUI.resHeight(8),
                          color: jakomoColor.concrete,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: supportUI.resHeight(180)),
                        child: HRHistoryItemStructure(
                          supportUI: supportUI,
                          jakomoColor: jakomoColor,
                          data: dataList,
                          commonUI: commonUI,
                        ),
                      )
                    ],
                  );
                }),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: NavigationWithFloating(supportUI: supportUI, jakomoColor: jakomoColor),
            )
          ],
        ),
      ),
    ));
  }
}
