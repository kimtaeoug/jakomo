import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/BottomNavigation/bottom_navigation_controller.dart';
import 'package:jakomo_recliner/Page/BottomNavigation/navigation_with_floating.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureWeightHistory/we_date_ui.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureWeightHistory/we_graph.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureWeightHistory/we_history_controller.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureWeightHistory/we_history_item_structure.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureWeightHistory/we_model.dart';
import 'package:jakomo_recliner/ServerData/history_controller.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class WEHistoryPage extends StatefulWidget{
  final SupportUI supportUI = SupportUI();
  final JakomoColor jakomoColor = JakomoColor();
  WEHistoryPage({Key? key}) : super(key: key);
  final List<WEModel> stList = [
    WEModel(weight: 64, date: DateTime(2021, 12, 16, 19)),
    WEModel(weight: 72, date: DateTime(2021, 12, 15, 7)),
    WEModel(weight: 68, date: DateTime(2021, 12, 15, 6)),
    WEModel(weight: 54, date: DateTime(2021, 12, 15, 3)),
    WEModel(weight: 48, date: DateTime(2021, 12, 15, 1)),
    WEModel(weight: 67, date: DateTime(2021, 12, 14, 3)),
    WEModel(weight: 72, date: DateTime(2021, 12, 14, 1)),
    WEModel(weight: 80, date: DateTime(2021, 12, 14, 0)),
    WEModel(weight: 90, date: DateTime(2021, 12, 12, 15)),
    WEModel(weight: 45, date: DateTime(2021, 12, 12, 12)),
    WEModel(weight: 32, date: DateTime(2021, 12, 12, 10)),
    WEModel(weight: 80, date: DateTime(2021, 12, 12, 5)),
    WEModel(weight: 43, date: DateTime(2021, 12, 12, 3)),
    WEModel(weight: 23, date: DateTime(2021, 12, 11, 5))
  ];
  @override
  State<StatefulWidget> createState() => _WEHistoryPage();

}

class _WEHistoryPage extends State<WEHistoryPage> {
  final SupportUI supportUI = SupportUI();
  final JakomoColor jakomoColor = JakomoColor();
  late final CommonUI commonUI =
  CommonUI(supportUI: supportUI, jakomoColor: jakomoColor);

  final WEHistoryController historyController = Get.put(WEHistoryController());

  late final List<WEModel> stList = widget.stList;
  late Map<DateTime, List<WEModel>> dataList;
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
                          serverHistoryController.weDataList.isNotEmpty
                              ? serverHistoryController.weDataList
                              : stList);
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: supportUI.resHeight(24)),
                            child: commonUI.pageTop('몸무게', ''),
                          ),
                          WEDateUI(supportUI: supportUI, jakomoColor: jakomoColor),
                          WEGraph(
                              supportUI: supportUI,
                              jakomoColor: jakomoColor,
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
                            child: WEHistoryItemStructure(
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
