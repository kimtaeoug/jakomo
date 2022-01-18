import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/BottomNavigation/bottom_navigation_controller.dart';
import 'package:jakomo_recliner/Page/BottomNavigation/navigation_with_floating.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/ServerData/history_controller.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'bp_date_ui.dart';
import 'bp_graph.dart';
import 'bp_history_controller.dart';
import 'bp_history_item_structure.dart';
import 'bp_model.dart';
class BPHistoryPage extends StatefulWidget{
  final SupportUI supportUI = SupportUI();
  final JakomoColor jakomoColor = JakomoColor();
  BPHistoryPage({Key? key}) : super(key: key);
  final List<BPModel> stList = [
    BPModel(systolic: 125, diastolic: 58, date: DateTime(2021, 12, 16, 19)),
    BPModel(systolic: 112, diastolic: 38, date: DateTime(2021, 12, 15, 7)),
    BPModel(systolic: 128, diastolic: 64, date: DateTime(2021, 12, 15, 6)),
    BPModel(systolic: 100, diastolic: 72, date: DateTime(2021, 12, 15, 3)),
    BPModel(systolic: 112, diastolic: 85, date: DateTime(2021, 12, 15, 1)),
    BPModel(systolic: 95, diastolic: 68, date: DateTime(2021, 12, 14, 3)),
    BPModel(systolic: 105, diastolic: 90, date: DateTime(2021, 12, 14, 1)),
    BPModel(systolic: 115, diastolic: 75, date: DateTime(2021, 12, 14, 0)),
    BPModel(systolic: 123, diastolic: 87, date: DateTime(2021, 12, 12, 15)),
    BPModel(systolic: 112, diastolic: 78, date: DateTime(2021, 12, 12, 12)),
    BPModel(systolic: 147, diastolic: 69, date: DateTime(2021, 12, 12, 10)),
    BPModel(systolic: 132, diastolic: 98, date: DateTime(2021, 12, 12, 5)),
    BPModel(systolic: 115, diastolic: 67, date: DateTime(2021, 12, 12, 3)),
    BPModel(systolic: 102, diastolic: 76, date: DateTime(2021, 12, 11, 5))
  ];
  @override
  State<StatefulWidget> createState() => _BPHistoryPage();
}
class _BPHistoryPage extends State<BPHistoryPage> {
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  late final CommonUI commonUI =
      CommonUI(supportUI: supportUI, jakomoColor: jakomoColor);

  final BPHistoryController historyController = Get.put(BPHistoryController());

  late final List<BPModel> stList = widget.stList;
  late Map<DateTime, List<BPModel>> dataList;
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
                child: Obx(() {
                  dataList = historyController.parsingData(
                      serverHistoryController.bpDataList.isNotEmpty
                          ? serverHistoryController.bpDataList
                          : stList);
                  return Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(bottom: supportUI.resHeight(24)),
                        child: commonUI.pageTop('혈압', ''),
                      ),
                      BPDateUI(supportUI: supportUI, jakomoColor: jakomoColor),
                      BPGraph(
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
                      BPHistoryItemStructure(
                        supportUI: supportUI,
                        jakomoColor: jakomoColor,
                        data: dataList,
                        commonUI: commonUI,
                      ),
                      SizedBox(
                        height: supportUI.resHeight(180),
                      )
                    ],
                  );
                }),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: NavigationWithFloating(
                  supportUI: supportUI, jakomoColor: jakomoColor),
            )
          ],
        ),
      ),
    ));
  }
}
