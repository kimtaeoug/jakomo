import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/ASApplicationPage/as_application_button.dart';
import 'package:jakomo_recliner/Page/ASApplicationPage/as_application_history.dart';
import 'package:jakomo_recliner/Page/BottomNavigation/bottom_navigation_controller.dart';
import 'package:jakomo_recliner/Page/BottomNavigation/navigation_with_floating.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class ASApplicationPage extends StatefulWidget{
  final SupportUI supportUI = SupportUI();
  final JakomoColor jakomoColor = JakomoColor();
  ASApplicationPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ASApplicationPage();

}

class _ASApplicationPage extends State<ASApplicationPage> {
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  late final CommonUI commonUI = CommonUI(supportUI: supportUI, jakomoColor: jakomoColor);
  late final ScrollController scrollController;
  final BottomNavigationController bottomNavigationController = Get.find();

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
  void dispose() {
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: supportUI.resWidth(48)),
                        child: commonUI.pageTop('신청 ','AS '),
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: supportUI.resWidth(2)),
                          child: commonUI.operationTime(),
                        ),
                      ),
                      Center(
                        child: ASApplicationButton(
                          supportUI: supportUI, jakomoColor: jakomoColor, commonUI: commonUI,),
                      ),
                      Center(
                        child: ASApplicationHistory(supportUI: supportUI, jakomoColor: jakomoColor, commonUI: commonUI,),
                      ),
                      SizedBox(
                        height: supportUI.resWidth(162),
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: NavigationWithFloating(supportUI: supportUI, jakomoColor: jakomoColor),
              )
            ],
          )),
    ));
  }
}
