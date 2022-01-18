import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/AskedQuestion/asked_1.dart';
import 'package:jakomo_recliner/Page/AskedQuestion/asked_2.dart';
import 'package:jakomo_recliner/Page/AskedQuestion/asked_3.dart';
import 'package:jakomo_recliner/Page/AskedQuestion/asked_4.dart';
import 'package:jakomo_recliner/Page/AskedQuestion/asked_all.dart';
import 'package:jakomo_recliner/Page/AskedQuestion/asked_question_controller.dart';
import 'package:jakomo_recliner/Page/AskedQuestion/asked_question_navigation.dart';
import 'package:jakomo_recliner/Page/BottomNavigation/bottom_navigation_controller.dart';
import 'package:jakomo_recliner/Page/BottomNavigation/navigation_with_floating.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class AskedquestionPage extends StatefulWidget{
  final SupportUI supportUI = SupportUI();
  final JakomoColor jakomoColor = JakomoColor();
  AskedquestionPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()=>_AskedquestionPage();
}

class _AskedquestionPage extends State<AskedquestionPage> {
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  late final CommonUI commonUI =
      CommonUI(supportUI: supportUI, jakomoColor: jakomoColor);


  final AskedQuestionController askedQuestionController =
      Get.put(AskedQuestionController());
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
                              padding: EdgeInsets.only(
                                  bottom: supportUI.resWidth(48)),
                              child: commonUI.pageTop('자주 묻는 질문', ''),
                            ),
                            AskedQuestionNaviagtion(
                                supportUI: supportUI, jakomoColor: jakomoColor),
                            Obx(() {
                              switch (askedQuestionController.idx.value) {
                                case 1:
                                  return Asked1(
                                      supportUI: supportUI,
                                      jakomoColor: jakomoColor);
                                case 2:
                                  return Asked2(
                                      supportUI: supportUI,
                                      jakomoColor: jakomoColor);
                                case 3:
                                  return Asked3(
                                      supportUI: supportUI,
                                      jakomoColor: jakomoColor);
                                case 4:
                                  return Asked4(
                                      supportUI: supportUI,
                                      jakomoColor: jakomoColor);
                                default:
                                  return AskedAll(
                                      supportUI: supportUI,
                                      jakomoColor: jakomoColor);
                              }
                            })
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
                ))));
  }
}
