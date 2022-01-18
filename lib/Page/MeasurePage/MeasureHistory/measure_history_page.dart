import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/BottomNavigation/bottom_navigation_controller.dart';
import 'package:jakomo_recliner/Page/BottomNavigation/navigation_with_floating.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureHistory/measure_history_conroller.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureHistory/measure_history_item_list.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureHistoryItem/measure_history_item_model.dart';
import 'package:jakomo_recliner/ServerData/history_controller.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'measure_history_calendar.dart';
class MeasureHistoryPage extends StatefulWidget{
  final SupportUI supportUI = SupportUI();
  final JakomoColor jakomoColor = JakomoColor();
  MeasureHistoryPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _MeasureHistoryPage();

}
class _MeasureHistoryPage extends State<MeasureHistoryPage> {
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  late final CommonUI commonUI =
      CommonUI(supportUI: supportUI, jakomoColor: jakomoColor);
  final HistoryController historyController = Get.find();
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
        child: SizedBox(
          width: supportUI.deviceWidth,
          height: supportUI.deviceHeight,
          child: Stack(
            children: [
              Obx((){
                return SizedBox(
                  width: supportUI.deviceWidth,
                  height: supportUI.deviceHeight,
                  child: SingleChildScrollView(
                    controller: scrollController,
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        commonUI.pageTop('측정기록', ''),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: supportUI.resHeight(30),
                                bottom: supportUI.resHeight(37)),
                            child: MeasureHistoryCalendar(
                              supportUI: supportUI,
                              jakomoColor: jakomoColor,
                              dataList: historyController.dataList.isNotEmpty?historyController.dataList:[],
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.only(bottom: supportUI.resHeight(160)),
                          child: MeasureHistoryItemList(
                            supportUI: supportUI,
                            jakomoColor: jakomoColor,
                            dataList: historyController.dataList.isNotEmpty?historyController.dataList:[],
                            commonUI: commonUI,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: NavigationWithFloating(
                    supportUI: supportUI, jakomoColor: jakomoColor),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
