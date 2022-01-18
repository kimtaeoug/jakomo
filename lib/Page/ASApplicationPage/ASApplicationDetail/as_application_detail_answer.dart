import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import '../as_application_history_model.dart';

class ASApplicationDetailAnswer extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final ASApplicationHistoryModel applicationHistoryModel;

  ASApplicationDetailAnswer(
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
      height: 1.7,
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
          Container(
            width: supportUI.deviceWidth * 8 / 9,
            height: supportUI.resHeight(1),
            color: jakomoColor.manatee.withOpacity(0.2),
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
                _dummyComments[applicationHistoryModel.state]!,
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
    1: '고객님 안녕하세요. 사진으로 확인 결과 교환\n진행을 도와드리려 합니다. 입력하신 주소와\n연락처로 담당자가 연락드릴 예정입니다.',
    2: '고객님 안녕하세요. 주문내역 확인 결과 교환이\n어려운것으로 확인됩니다. 자세한 문의는\n고객센터로 연락부탁드립니다.',
    3: '',
    4: '고객님 안녕하세요. 사진으로 확인 결과 교환\n진행을 도와드리려 합니다. 입력하신 주소와\n연락처로 담당자가 연락드릴 예정입니다.'
  };
}
