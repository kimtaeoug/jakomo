import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/HomePage/JakomoCustomCare/jakomo_custom_care_model.dart';
import 'package:jakomo_recliner/Page/RestCarePage/RestGuideItem/rest_guide_structure.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class RestGuideItem extends StatelessWidget{
  final SupportUI supportUI = SupportUI();
  final JakomoColor jakomoColor = JakomoColor();
  RestGuideItem({Key? key}) : super(key: key);
  final JakomoCustomCareModel jakomoCustomCareModel = Get.arguments['model'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: jakomoColor.black,
      body: WillPopScope(
        onWillPop: (){
          Get.back();
          return Future(()=>false);
        },
        child: SizedBox(
          width: supportUI.deviceWidth,
          height: supportUI.deviceHeight,
          child: RestGuideStructure(supportUI: supportUI, jakomoColor: jakomoColor, jakomoCustomCareModel: jakomoCustomCareModel),
        ),
      ),
    ));
  }
}