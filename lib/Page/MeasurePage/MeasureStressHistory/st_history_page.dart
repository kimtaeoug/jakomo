import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/BottomNavigation/bottom_navigation_controller.dart';
import 'package:jakomo_recliner/Page/BottomNavigation/navigation_with_floating.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureStressHistory/st_date_ui.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureStressHistory/st_graph.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureStressHistory/st_history_controller.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureStressHistory/st_history_item_structure.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureStressHistory/st_model.dart';
import 'package:jakomo_recliner/ServerData/history_controller.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class STHistoryPage extends StatefulWidget{
  final SupportUI supportUI = SupportUI();
  final JakomoColor jakomoColor = JakomoColor();
  final List<STModel> stList = [
    STModel(stress: 64, date: DateTime(2021, 12, 16, 19)),
    STModel(stress: 72, date: DateTime(2021, 12, 15, 7)),
    STModel(stress: 68, date: DateTime(2021, 12, 15, 6)),
    STModel(stress: 54, date: DateTime(2021, 12, 15, 3)),
    STModel(stress: 48, date: DateTime(2021, 12, 15, 1)),
    STModel(stress: 67, date: DateTime(2021, 12, 14, 3)),
    STModel(stress: 72, date: DateTime(2021, 12, 14, 1)),
    STModel(stress: 80, date: DateTime(2021, 12, 14, 0)),
    STModel(stress: 90, date: DateTime(2021, 12, 12, 15)),
    STModel(stress: 45, date: DateTime(2021, 12, 12, 12)),
    STModel(stress: 32, date: DateTime(2021, 12, 12, 10)),
    STModel(stress: 80, date: DateTime(2021, 12, 12, 5)),
    STModel(stress: 43, date: DateTime(2021, 12, 12, 3)),
    STModel(stress: 23, date: DateTime(2021, 12, 11, 5))
  ];
  STHistoryPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _STHistoryPage();

}

class _STHistoryPage extends State<STHistoryPage> {
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;

  late final CommonUI commonUI =
  CommonUI(supportUI: supportUI, jakomoColor: jakomoColor);

  final STHistoryController historyController = Get.put(STHistoryController());

  late final List<STModel> stList = widget.stList;
  late Map<DateTime, List<STModel>> dataList;
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
                          serverHistoryController.stDataList.isNotEmpty
                              ? serverHistoryController.stDataList
                              : stList);
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: supportUI.resHeight(24)),
                            child: commonUI.pageTop('스트레스', ''),
                          ),
                          STDateUI(supportUI: supportUI, jakomoColor: jakomoColor),
                          STGraph(
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
                            child: STHistoryItemStructure(
                                supportUI: supportUI,
                                jakomoColor: jakomoColor,
                                data: dataList,
                                commonUI : commonUI
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
