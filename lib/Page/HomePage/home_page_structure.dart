import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/BottomNavigation/bottom_navigation_controller.dart';
import 'package:jakomo_recliner/Page/HomePage/Footer/footer.dart';
import 'package:jakomo_recliner/Page/HomePage/JakomoCustomCare/jakomo_custom_care.dart';
import 'package:jakomo_recliner/Page/HomePage/JakomoNews/jakomo_news.dart';
import 'package:jakomo_recliner/Page/HomePage/JakomoUsefulInfo/jakomo_useful_info.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'JakomoEvent/jakomo_event_container.dart';
import 'JakomoRecommend/jakomo_recommend_container.dart';
import 'home_page_controller.dart';

class HomePageStructure extends StatefulWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  const HomePageStructure(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageStructure();

}
class _HomePageStructure extends State<HomePageStructure> {
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;

  final HomePageController homePageController = Get.find();

  late final ScrollController scrollController;
  final BottomNavigationController bottomNavigationController = Get.find();
  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      homePageController.scrollOffset.value = scrollController.offset;
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
            Obx((){
              return Padding(
                padding: EdgeInsets.only(top: supportUI.resWidth(394)),
                // padding: EdgeInsets.only(top: supportUI.deviceHeight*25/32 - supportUI.resHeight(60)),
                child: Container(
                  width: supportUI.deviceWidth,
                  height: supportUI.resHeight(60),
                  decoration: BoxDecoration(
                      color: jakomoColor.white,
                      borderRadius: BorderRadius.vertical(top: homePageController.scrollOffset.value >100?const Radius.circular(0):const Radius.circular(15)),
                      border: Border.all(color: jakomoColor.white, width: 0)
                  ),
                ),
              );
            }),
            JakomoNews(supportUI: supportUI, jakomoColor: jakomoColor),
            JakomoEventContainer(supportUI: supportUI, jakomoColor: jakomoColor),
            JakomoUsefulInfo(supportUI: supportUI, jakomoColor: jakomoColor),
            JakomoRecommendContainer(
                supportUI: supportUI, jakomoColor: jakomoColor),
            Container(
              width: supportUI.deviceWidth,
              height: supportUI.resHeight(1),
              color: jakomoColor.alabaster,
            ),
            JakomoCustomCare(
                supportUI: supportUI, jakomoColor: jakomoColor),
            Container(
              decoration: BoxDecoration(
                color: jakomoColor.white,
                border: Border.all(color: jakomoColor.white, width: 0)
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: supportUI.resHeight(40),
                    bottom: supportUI.resHeight(50)),
                child: Container(
                  width: supportUI.deviceWidth,
                  height: supportUI.resHeight(8),
                  color: jakomoColor.alabaster,
                ),
              ),
            ),
            Footer(supportUI: supportUI, jakomoColor: jakomoColor)
          ],
        ),
      ),
    );
  }
}
