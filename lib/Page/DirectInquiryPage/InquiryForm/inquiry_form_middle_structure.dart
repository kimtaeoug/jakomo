import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/Page/DirectInquiryPage/InquiryForm/inquiry_form_contents.dart';
import 'package:jakomo_recliner/Page/DirectInquiryPage/InquiryForm/inquiry_form_select.dart';
import 'package:jakomo_recliner/Page/DirectInquiryPage/InquiryForm/inquiry_form_title.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class InquiryFormMiddleStructure extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  const InquiryFormMiddleStructure({Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: supportUI.deviceWidth,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: supportUI.resWidth(60),
              ),
              InquiryFormTitle(supportUI: supportUI, jakomoColor: jakomoColor),
              InquiryFormContents(supportUI: supportUI, jakomoColor: jakomoColor)
            ],
          ),
          Center(
            child: InquiryFormSelect(supportUI: supportUI, jakomoColor: jakomoColor),
          )
        ],
      ),
    );
  }
}
