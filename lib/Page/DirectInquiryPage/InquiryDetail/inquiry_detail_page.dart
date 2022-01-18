import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/DirectInquiryPage/InquiryDetail/inquiry_detail_contents.dart';
import 'package:jakomo_recliner/Page/DirectInquiryPage/InquiryDetail/inquiry_detail_footer.dart';
import 'package:jakomo_recliner/Page/DirectInquiryPage/InquiryHistory/inquiry_history_model.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';


class InquiryDetailPage extends StatelessWidget{
  final SupportUI supportUI = SupportUI();
  final JakomoColor jakomoColor = JakomoColor();
  late final CommonUI commonUI = CommonUI(supportUI: supportUI, jakomoColor: jakomoColor);
  InquiryDetailPage({Key? key}):super(key: key);
  final InquiryHistoryModel inquiryHistoryModel = Get.arguments as InquiryHistoryModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: jakomoColor.white,
      body: WillPopScope(
        onWillPop: (){
          Get.back();
          return Future(()=>false);
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
                  child: commonUI.pageTop('문의', '1:1'),
                ),
                InquiryDetailContents(supportUI: supportUI, jakomoColor: jakomoColor, applicationHistoryModel: inquiryHistoryModel),
                InquiryDetailFooter(supportUI: supportUI, jakomoColor: jakomoColor)
              ],
            ),
          ),
        ),
      ),
    ));
  }
}