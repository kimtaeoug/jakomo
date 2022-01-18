import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/ASApplicationPage/ASApplicationDetail/as_application_detail_contents.dart';
import 'package:jakomo_recliner/Page/ASApplicationPage/ASApplicationDetail/as_application_detail_footer.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import '../as_application_history_model.dart';

class ASApplicationDetailPage extends StatelessWidget {
  final SupportUI supportUI = SupportUI();
  final JakomoColor jakomoColor = JakomoColor();
  late final CommonUI commonUI =
      CommonUI(supportUI: supportUI, jakomoColor: jakomoColor);
  final ASApplicationHistoryModel applicationHistoryModel = Get.arguments as ASApplicationHistoryModel;
  ASApplicationDetailPage({Key? key}) : super(key: key);

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
        child: SizedBox(
          width: supportUI.deviceWidth,
          height: supportUI.deviceHeight,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: supportUI.resWidth(40)),
                  child: commonUI.pageTop('신청', 'AS '),
                ),
                ASApplicationDetailContents(
                    supportUI: supportUI,
                    jakomoColor: jakomoColor,
                    commonUI: commonUI,
                    applicationHistoryModel: applicationHistoryModel),
                ASApplicationDetailFooter(
                    supportUI: supportUI, jakomoColor: jakomoColor)
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
