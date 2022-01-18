import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/BLE/ble_controller.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_bottomsheet.dart';
import 'package:jakomo_recliner/Routes/jakomo_routes.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'MeasureProgressPage/measure_progress_controller.dart';

class MeasureButton extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;
  MeasureButton({Key? key, required this.supportUI, required this.jakomoColor, required this.commonUI}):super(key: key);
  late final TextStyle _guideTextStyle = TextStyle(
    color: jakomoColor.black,
    fontWeight: FontWeight.bold,
    fontSize: supportUI.resFontSize(14),
    fontFamily: supportUI.fontNanum('b')
  );

  final BLEController bleController = Get.find();
  late final JakomoBottomSheet jakomoBottomSheet = JakomoBottomSheet(supportUI: supportUI, jakomoColor: jakomoColor);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.deviceWidth*5/6,
      height: supportUI.resHeight(162),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        color: jakomoColor.alto.withOpacity(0.2)
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: supportUI.resHeight(13)),
              child: Center(
                child: Text('자주 측정하는 것 만으로도\n건강관리에 큰 도움이 됩니다.', style: _guideTextStyle, textAlign: TextAlign.center,),
              ),
            ),
            GestureDetector(
              onTap: (){
                if(bleController.connection.value == false){
                  jakomoBottomSheet.showConnectionNeed(context);
                }else{
                  jakomoBottomSheet.showMeasureGuide(context);
               }
              },
              child: commonUI.pistachioSmallButton('측정하기'),
            )
          ],
        ),
      ),
    );
  }
  // late final TextStyle _guideBottomTextStyle = TextStyle(
  //   fontWeight: FontWeight.bold,
  //   fontSize: supportUI.resFontSize(24),
  //   color: jakomoColor.black,
  //   fontFamily: supportUI.fontNanum('eb')
  // );
  // late final TextStyle _guideContentsTextStyle = TextStyle(
  //   color: jakomoColor.boulder,
  //   fontSize: supportUI.resFontSize(14),
  //   fontFamily: supportUI.fontNanum('r'),
  //   height: 1.6
  // );
  // late final JakomoBottomSheet jakomoBottomSheet = JakomoBottomSheet(supportUI: supportUI, jakomoColor: jakomoColor);
  // final String _guideContents = '측정이 완료될 때까지 취소가 어렵습니다.정확한 측정을 위해 리클라이너에 안전하게 착석해주시길 바랍니다.';
  // final BLEController bleController = Get.find();
  // Future<void> _showMeasureGuide(BuildContext context) async{
  //   showModalBottomSheet(context: context, builder: (BuildContext context){
  //     return Container(
  //       width: supportUI.deviceWidth,
  //       height: supportUI.resHeight(250),
  //       decoration: BoxDecoration(
  //         borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
  //         color: jakomoColor.white,
  //       ),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Center(
  //             child: Text('안내', style: _guideBottomTextStyle,),
  //           ),
  //           Center(
  //             child:  Padding(
  //               padding: EdgeInsets.only(top: supportUI.resHeight(5), bottom: supportUI.resHeight(13)),
  //               child: SizedBox(
  //                 width: supportUI.deviceWidth*3/4,
  //                 child: Text(_guideContents, textAlign: TextAlign.center, style: _guideContentsTextStyle, softWrap: true,),
  //               ),
  //             ),
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               GestureDetector(
  //                 onTap: (){
  //                   Get.back();
  //                 },
  //                 child: commonUI.concreteButton('취소'),
  //               ),
  //               GestureDetector(
  //                 onTap: (){
  //                   Get.back();
  //                   bleController.measureStart();
  //                   Get.toNamed(JakomoRoutes.careProgress);
  //                   measureProgressController.progressValue.value = 0;
  //                   measureProgressController.startProgressTimer();
  //                 },
  //                 child: Padding(
  //                   padding: EdgeInsets.only(left: supportUI.resWidth(8)),
  //                   child: commonUI.pistachioSmallButton('확인'),
  //                 ),
  //               )
  //             ],
  //           )
  //         ],
  //       ),
  //     );
  //   }, shape: const RoundedRectangleBorder(
  //     borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
  //   ), isDismissible: true, enableDrag: false);
  // }
}