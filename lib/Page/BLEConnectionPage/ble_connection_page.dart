import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/BLEConnectionPage/ble_connection_background.dart';
import 'package:jakomo_recliner/Page/BLEConnectionPage/ble_connection_bottomsheet.dart';
import 'package:jakomo_recliner/Page/BLEConnectionPage/ble_connection_close_button.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class BLEConnectionPage extends StatelessWidget{
  final SupportUI supportUI = SupportUI();
  final JakomoColor jakomoColor = JakomoColor();
  late final CommonUI commonUI = CommonUI(supportUI: supportUI, jakomoColor: jakomoColor);
  BLEConnectionPage({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: jakomoColor.alabaster,
      body: WillPopScope(
        onWillPop: (){
          Get.back();
          return Future(()=>false);
        },
        child: Stack(
          children: [
            SizedBox(
              width: supportUI.deviceWidth,
              height: supportUI.deviceHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BLEConnectionBackGround(supportUI: supportUI, jakomoColor: jakomoColor),
                  BLEConnectionBottomSheet(supportUI: supportUI, jakomoColor: jakomoColor, commonUI: commonUI,)
                ],
              ),
            ),
            SizedBox(
              width: supportUI.deviceWidth,
              height: supportUI.deviceHeight,
              child: Padding(
                padding: EdgeInsets.only(right: supportUI.resWidth(30), bottom: supportUI.resHeight(24)),
                child: Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: BLEConnectionCloseButton(supportUI: supportUI, jakomoColor: jakomoColor),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
  
}