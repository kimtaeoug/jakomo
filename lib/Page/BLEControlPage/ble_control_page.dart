import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/BLEConnectionPage/ble_connection_close_button.dart';
import 'package:jakomo_recliner/Page/BLEControlPage/ble_navigation.dart';
import 'package:jakomo_recliner/Page/BLEControlPage/ble_navigation_controller.dart';
import 'package:jakomo_recliner/Page/BLEControlPage/ble_popup.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class BLEControlPage extends StatelessWidget{
  final SupportUI supportUI = SupportUI();
  final JakomoColor jakomoColor = JakomoColor();
  BLEControlPage({Key? key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: jakomoColor.white,
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
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: supportUI.deviceHeight
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: supportUI.resWidth(30)),
                            child: BLEPopup(supportUI: supportUI, jakomoColor: jakomoColor),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: supportUI.resWidth(50), bottom: supportUI.resWidth(45)),
                          child: Center(
                            child: SizedBox(
                              height: supportUI.resWidth(210),
                              child: Image.asset('images/recommanded_chair.png',fit: BoxFit.fitHeight,),
                            ),
                          ),
                        ),
                        Expanded(child: BLENavigation(supportUI: supportUI, jakomoColor: jakomoColor))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: supportUI.deviceWidth,
              height: supportUI.deviceHeight,
              child: Padding(
                padding: EdgeInsets.only(right: supportUI.resWidth(28), bottom: supportUI.resWidth(24)),
                child: Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: GestureDetector(
                    onTap: ()=>Get.back(),
                    child: BLEConnectionCloseButton(supportUI: supportUI, jakomoColor: jakomoColor),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

}