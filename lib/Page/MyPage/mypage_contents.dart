import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/BLE/ble_controller.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/MyPage/mypage_care_item.dart';
import 'package:jakomo_recliner/Page/MyPage/mypage_device.dart';
import 'package:jakomo_recliner/Page/MyPage/mypage_info.dart';
import 'package:jakomo_recliner/ServerData/history_controller.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class MyPageContents extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;
  MyPageContents({
    Key? key,
    required this.supportUI,
    required this.jakomoColor,
    required this.commonUI
  }) : super(key: key);
  final HistoryController historyController = Get.find();
  late final TextStyle _bleTitleTextStyle = TextStyle(
    color: jakomoColor.black,
    fontFamily: supportUI.fontNanum('eb'),
    fontWeight: FontWeight.w600,
    fontSize: supportUI.resFontSize(16)
  );
  late final TextStyle _guideTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontWeight: FontWeight.w400,
      fontSize: supportUI.resFontSize(12),
      fontFamily: supportUI.fontNanum('r'));
  final BLEController bleController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.deviceWidth,
      decoration: BoxDecoration(
          color: jakomoColor.alabaster,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: supportUI.resWidth(58), bottom: supportUI.resWidth(39)),
            child: MyPageInfo(supportUI: supportUI, jakomoColor: jakomoColor),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyPageCareItem(
                  supportUI: supportUI,
                  jakomoColor: jakomoColor,
                  title: 'time',
                  value: 1.7),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: supportUI.resWidth(8)),
                child: Obx((){
                  historyController.calculateMeasureCount();
                  return MyPageCareItem(
                      supportUI: supportUI,
                      jakomoColor: jakomoColor,
                      title: 'heartbeat',
                      value: historyController.dataList.isNotEmpty?historyController.measureCount.value:0);
                }),
              ),
              MyPageCareItem(
                  supportUI: supportUI,
                  jakomoColor: jakomoColor,
                  title: 'calendar',
                  value: 5)
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: supportUI.resWidth(35), bottom: supportUI.resWidth(34)),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Padding(
                    padding: EdgeInsets.only(left: supportUI.commonLeft(), bottom: supportUI.resHeight(20)),
                    child: Text('연결되어 있는 제품', style: _bleTitleTextStyle,),
                  ),
                ),
                commonUI.bleConnection(),
                Obx((){
                  return bleController.connection.value?
                  Container(height: supportUI.resHeight(16),)
                      :Padding(
                    padding: EdgeInsets.only(left: supportUI.commonLeft(), top: supportUI.resHeight(13)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: supportUI.resWidth(16),
                          height: supportUI.resWidth(16),
                          child: Image.asset('images/lined_info_icon.png',),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: supportUI.resWidth(5)),
                          child: SizedBox(
                            height: supportUI.resWidth(16),
                            child: Text('자코모의 리클라이너는 블루투스로 연결됩니다', style: _guideTextStyle,),
                          ),
                        )
                      ],
                    ),
                  );
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
