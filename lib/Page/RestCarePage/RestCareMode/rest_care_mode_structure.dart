import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/Page/RestCarePage/RestCareMode/rest_care_guide_text.dart';
import 'package:jakomo_recliner/Page/RestCarePage/RestCareMode/rest_care_mode.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class RestCareModeStructure extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  const RestCareModeStructure({Key? key, required this.supportUI, required this.jakomoColor}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.deviceWidth,
      height: supportUI.resWidth(160),
      color: jakomoColor.alto.withOpacity(0.3),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RestCareMode(supportUI: supportUI, jakomoColor: jakomoColor),
            Padding(
              padding: EdgeInsets.only(top: supportUI.resHeight(15)),
              child: RestCareGuideText(supportUI: supportUI, jakomoColor: jakomoColor),
            )
          ],
        ),
      ),
    );
  }
}