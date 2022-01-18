import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/BottomNavigation/bottom_navigation_controller.dart';
import 'package:jakomo_recliner/Page/BottomNavigation/navigation_with_floating.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_bottomsheet.dart';
import 'package:jakomo_recliner/Page/HomePage/JakomoEvent/jakomo_event.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureHistoryItem/measure_history_item.dart';
import 'package:jakomo_recliner/Page/MeasurePage/measure_button.dart';
import 'package:jakomo_recliner/Page/MeasurePage/measure_logo.dart';
import 'package:jakomo_recliner/Page/MeasurePage/measure_no_data.dart';
import 'package:jakomo_recliner/Page/MeasurePage/measure_recent_history_title.dart';
import 'package:jakomo_recliner/ServerData/history_controller.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class MeasurePage extends StatefulWidget {
  final SupportUI supportUI = SupportUI();
  final JakomoColor jakomoColor = JakomoColor();

  MeasurePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MeasurePage();

}
class _MeasurePage extends State<MeasurePage>{
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  late final CommonUI commonUI =
  CommonUI(supportUI: supportUI, jakomoColor: jakomoColor);
  final HistoryController historyController = Get.find();
  late final JakomoBottomSheet jakomoBottomSheet = JakomoBottomSheet(supportUI: supportUI, jakomoColor: jakomoColor);
  final bool? measureFail = Get.arguments as bool;
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
    if(measureFail != null){
      if(measureFail == true){
        jakomoBottomSheet.showMeasureFail(context);
      }
    }
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
                  SizedBox(
                    width: supportUI.deviceWidth,
                    height: supportUI.deviceHeight,
                    child: SingleChildScrollView(
                      controller: scrollController,
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: supportUI.resHeight(25),
                                  left: supportUI.resWidth(28),
                                  bottom: supportUI.resHeight(34)),
                              child: MeasureLogo(
                                  supportUI: supportUI, jakomoColor: jakomoColor),
                            ),
                          ),
                          Center(
                            child: MeasureButton(
                              supportUI: supportUI,
                              jakomoColor: jakomoColor,
                              commonUI: commonUI,
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: supportUI.resHeight(34),
                                  bottom: supportUI.resHeight(21)),
                              child: MeasureRecentHistoryTitle(
                                  supportUI: supportUI, jakomoColor: jakomoColor),
                            ),
                          ),
                          Center(
                            child: Obx(() {
                              return historyController.dataList.isNotEmpty
                                  ? MeasureHistoryItem(
                                  supportUI: supportUI,
                                  jakomoColor: jakomoColor,
                                  measureHistoryItemModel:
                                  historyController.dataList.last,
                                  commonUI: commonUI)
                                  : MeasureNoData(
                                  supportUI: supportUI,
                                  jakomoColor: jakomoColor);
                            }),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: supportUI.resHeight(32),
                                bottom: supportUI.resHeight(120)),
                            child: JakomoEvent(
                                supportUI: supportUI, jakomoColor: jakomoColor),
                          )
                        ],
                      ),
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
          ),
        ));
  }
}