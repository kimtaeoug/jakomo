import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:jakomo_recliner/Page/DirectInquiryPage/InquiryHistory/inquiry_history_item.dart';
import 'package:jakomo_recliner/Page/DirectInquiryPage/InquiryHistory/inquiry_history_model.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class InquiryHistory extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  InquiryHistory(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);

  final List<InquiryHistoryModel> _model = [
    InquiryHistoryModel(
        idx: 1,
        title: '결제가 어떻게 되는 건가요?.',
        date: '2020.10.7',
        state: 1,
        contents: '회원탈퇴하면서 환불을 받아야할 것 같아요\n어떻게 환불 받나요?',
        img: ['as_img']),
    InquiryHistoryModel(
        idx: 2,
        title: '환불 문의드려요.',
        date: '2020.10.7',
        state: 2,
        contents: '회원탈퇴하면서 환불을 받아야할 것 같아요\n어떻게 환불 받나요?',
        img: ['as_img']),
    InquiryHistoryModel(
        idx: 3,
        title: '리클라이너 교환 요청합니다.',
        date: '2020.10.7',
        state: 2,
        contents: '회원탈퇴하면서 환불을 받아야할 것 같아요\n어떻게 환불 받나요?',
        img: []),

  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
          _model.length,
              (index) => Padding(
            padding: EdgeInsets.only(bottom: supportUI.resWidth(20)),
            child: InquiryHistoryItem(
                supportUI: supportUI,
                jakomoColor: jakomoColor,
                inquiryHistoryModel: _model[index]),
          )),
    );
  }
}
