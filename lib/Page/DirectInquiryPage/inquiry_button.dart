import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/DirectInquiryPage/InquiryForm/inquiry_form_page.dart';
import 'package:jakomo_recliner/Routes/jakomo_routes.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class InquiryButton extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;
  const InquiryButton(
      {Key? key, required this.supportUI, required this.jakomoColor, required this.commonUI})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: (){
            launch("tel://1588-6007");
          },
          child: commonUI.pistachioBorderButton('전화문의하기'),
        ),
        Padding(
          padding: EdgeInsets.only(left: supportUI.resWidth(8)),
          child: GestureDetector(
            onTap: (){
              Get.toNamed(JakomoRoutes.inquiryApplication);
            },
            child: commonUI.pistachioSmallButton('문의하기'),
          ),
        )
      ],
    );
  }
}
