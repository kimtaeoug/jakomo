import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureProgressPage/measure_basic_progress.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureProgressPage/measure_progress_controller.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureProgressPage/measure_progress_guide.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class MeasureProgressPage extends StatelessWidget{
  final SupportUI supportUI = SupportUI();
  final JakomoColor jakomoColor = JakomoColor();
  MeasureProgressPage({Key? key}):super(key: key);
  final MeasureProgressController measureProgressController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: jakomoColor.alabaster2,
      body: WillPopScope(
        onWillPop: (){
          // Get.back();
          return Future(()=>false);
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: supportUI.resHeight(35),
              ),
              // MeasureProgressBar(supportUI: supportUI, jakomoColor: jakomoColor),
              MeasureBasicProgress(supportUI: supportUI, jakomoColor: jakomoColor),
              Padding(
                padding: EdgeInsets.only(bottom: supportUI.resHeight(30)),
                child: MeasureProgressGuide(supportUI: supportUI, jakomoColor: jakomoColor),
              )
            ],
          ),
        ),
      ),
    ));
  }
}