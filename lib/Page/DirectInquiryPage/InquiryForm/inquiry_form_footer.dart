import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';



class InquiryFormFooter extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;
  InquiryFormFooter(
      {Key? key, required this.supportUI, required this.jakomoColor, required this.commonUI})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: supportUI.resWidth(24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: commonUI.concreteButton('취소'),
          ),
          Padding(
            padding: EdgeInsets.only(left: supportUI.resWidth(8)),
            child: GestureDetector(
              onTap: () {},
              child: commonUI.pistachioSmallButton('문의하기'),
            ),
          )
        ],
      ),
    );
  }

}
