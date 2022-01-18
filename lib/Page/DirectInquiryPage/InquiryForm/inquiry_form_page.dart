import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/DirectInquiryPage/InquiryForm/inquiry_form_controller.dart';
import 'package:jakomo_recliner/Page/DirectInquiryPage/InquiryForm/inquiry_form_footer.dart';
import 'package:jakomo_recliner/Page/DirectInquiryPage/InquiryForm/inquiry_form_guide.dart';
import 'package:jakomo_recliner/Page/DirectInquiryPage/InquiryForm/inquiry_form_img.dart';
import 'package:jakomo_recliner/Page/DirectInquiryPage/InquiryForm/inquiry_form_middle_structure.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class InquiryFormPage extends StatelessWidget{
  final SupportUI supportUI = SupportUI();
  final JakomoColor jakomoColor = JakomoColor();
  late final CommonUI commonUI = CommonUI(supportUI: supportUI, jakomoColor: jakomoColor);
  InquiryFormPage({Key? key}):super(key: key);
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
                  padding: EdgeInsets.only(bottom: supportUI.resWidth(36)),
                  child: commonUI.pageTop('문의하기', '1:1'),
                ),
                InquiryFormGuide(supportUI: supportUI, jakomoColor: jakomoColor),
                InquiryFormMiddleStructure(supportUI: supportUI, jakomoColor: jakomoColor),
                Padding(
                  padding: EdgeInsets.only(bottom: supportUI.resHeight(24)),
                  child: InquiryFormImg(supportUI: supportUI, jakomoColor: jakomoColor),
                ),
                Container(
                  width: supportUI.deviceWidth,
                  height: supportUI.resHeight(10),
                  color: jakomoColor.concrete.withOpacity(0.6),
                ),
                InquiryFormFooter(supportUI: supportUI, jakomoColor: jakomoColor, commonUI: commonUI,)
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
