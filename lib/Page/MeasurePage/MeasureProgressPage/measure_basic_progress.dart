import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureProgressPage/measure_center_contents.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'measure_progress_controller.dart';

class MeasureBasicProgress extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  MeasureBasicProgress({Key? key, required this.supportUI, required this.jakomoColor}) :super(key: key);
  final MeasureProgressController measureProgressController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: supportUI.resWidth(250),
      height: supportUI.resHeight(250),
      child: Stack(
        children: [
          SizedBox(
            width: supportUI.resWidth(250),
            height: supportUI.resHeight(250),
            child: Obx((){
              return CircularProgressIndicator(
                backgroundColor: jakomoColor.gallery2,
                color: jakomoColor.pistachio,
                strokeWidth: 2,
                value: measureProgressController.progressValue.value/1000,
              );
            }),
          ),
          Center(
            child: MeasureCenterContents(supportUI: supportUI, jakomoColor: jakomoColor),
          )
        ],
      ),
    );
  }

}