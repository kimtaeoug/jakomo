import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/Page/DirectInquiryPage/InquiryHistory/inquiry_history_model.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class InquiryDetailAnswer extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final InquiryHistoryModel applicationHistoryModel;

  InquiryDetailAnswer(
      {Key? key,
        required this.supportUI,
        required this.jakomoColor,
        required this.applicationHistoryModel})
      : super(key: key);
  late final TextStyle _titleTextStyle = TextStyle(
      color: jakomoColor.pistachio,
      fontFamily: supportUI.fontNanum('eb'),
      fontSize: supportUI.resFontSize(16),
      fontWeight: FontWeight.bold);
  late final TextStyle _commentsTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontNanum('b'),
      fontWeight: FontWeight.w400);
  late final TextStyle _dateTextStyle = TextStyle(
      color: jakomoColor.silverChalice,
      fontSize: supportUI.resFontSize(12),
      fontFamily: supportUI.fontPoppings('regular'));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: supportUI.deviceWidth * 8 / 9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: SizedBox(
              width: supportUI.deviceWidth*7/9,
              height: supportUI.resWidth(1),
              child: DottedLine(
                direction: Axis.horizontal,
                lineLength: supportUI.deviceWidth*7/9,
                lineThickness: 1.0,
                dashLength: supportUI.resWidth(4),
                dashColor: jakomoColor.manatee.withOpacity(0.2),
                dashGapColor: jakomoColor.transperent,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: supportUI.resWidth(20),
                top: supportUI.resWidth(24),
                bottom: supportUI.resWidth(19)),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                '답변드립니다.',
                style: _titleTextStyle,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: supportUI.resWidth(20)),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                _dummyComments[applicationHistoryModel.idx]!,
                style: _commentsTextStyle,
                softWrap: true,
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: supportUI.resWidth(20),
                top: supportUI.resWidth(11.4),
                bottom: supportUI.resWidth(30)),
            child: Align(
              alignment: AlignmentDirectional.bottomStart,
              child: Text(
                applicationHistoryModel.date,
                style: _dateTextStyle,
              ),
            ),
          )
        ],
      ),
    );
  }

  // 1 - as 진행
  // 2 - as 진행 불가
  // 3 - as 진행 대기
  // 4 - as 진행 완료
  final Map<int, String> _dummyComments = {
    1: '고객님 안녕하세요. 환불 정책 말씀드리겠습니다. 좋은 하루 보내세요. 감사합니다.',
    2: '고객님 안녕하세요. 환불 정책 말씀드리겠습니다. 좋은 하루 보내세요. 감사합니다.',
    3: '',
  };
}
