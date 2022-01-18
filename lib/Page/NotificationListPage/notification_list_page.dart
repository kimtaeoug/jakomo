import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/BottomNavigation/bottom_navigation_controller.dart';
import 'package:jakomo_recliner/Page/BottomNavigation/navigation_with_floating.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/NotificationListPage/notification_list_item.dart';
import 'package:jakomo_recliner/Page/NotificationListPage/notification_model.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';
class NotificationListPage extends StatefulWidget{
  final SupportUI supportUI = SupportUI();
  final JakomoColor jakomoColor = JakomoColor();
  NotificationListPage({Key? key}) : super(key: key);
  final List<NotificationModel> _modelList = [
    NotificationModel(idx: 1, title: '이용약관 변경 사전 안내', date: '2020.4.7'),
    NotificationModel(idx: 2, title: '회원 등급 변경 안내', date: '2020.4.7'),
    NotificationModel(idx: 3, title: '환불 처리 내용 안내', date: '2020.4.7'),
  ];

  @override
  State<StatefulWidget> createState() => _NotificationListPage();
}
class _NotificationListPage extends State<NotificationListPage> {
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  late final CommonUI commonUI =
      CommonUI(supportUI: supportUI, jakomoColor: jakomoColor);

  late final List<NotificationModel> _modelList = widget._modelList;
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
                        padding:
                            EdgeInsets.only(bottom: supportUI.resWidth(48)),
                        child: commonUI.pageTop('공지사항', ''),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(
                            _modelList.length,
                            (index) => NotificationListItem(
                                supportUI: supportUI,
                                jakomoColor: jakomoColor,
                                askedquestionModel: _modelList[index])),
                      ),
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
    );
  }
}
