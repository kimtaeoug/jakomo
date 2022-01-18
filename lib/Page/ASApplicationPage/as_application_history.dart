import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/Page/ASApplicationPage/as_application_history_item.dart';
import 'package:jakomo_recliner/Page/ASApplicationPage/as_application_history_model.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class ASApplicationHistory extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;
  ASApplicationHistory(
      {Key? key, required this.supportUI, required this.jakomoColor, required this.commonUI})
      : super(key: key);

  final List<ASApplicationHistoryModel> _model = [
    ASApplicationHistoryModel(
        idx: 1,
        title: '리클라이너 교환 요청합니다.',
        date: '2020.10.7',
        time: '12:00',
        state: 1,
        name: '홍길동',
        phoneNumber: '010.1234.5678',
        address: '서울 마포구 양화로 3길, 리메인',
        contents: '리클라이너가 찢어진 부분이 있어서 교환하고 싶어요. 어떻게 교환할 수 있나요?',
        img: ['as_img']),
    ASApplicationHistoryModel(
        idx: 2,
        title: '리클라이너 교환 요청합니다.',
        date: '2020.10.7',
        time: '12:00',
        state: 2,
        name: '홍길동',
        phoneNumber: '010.1234.5678',
        address: '서울 마포구 양화로 3길, 리메인',
        contents: '리클라이너가 찢어진 부분이 있어서 교환하고 싶어요. 어떻게 교환할 수 있나요?',
        img: ['as_img']),
    ASApplicationHistoryModel(
        idx: 3,
        title: '리클라이너 교환 요청합니다.',
        date: '2020.10.7',
        time: '12:00',
        state: 3,
        name: '홍길동',
        phoneNumber: '010.1234.5678',
        address: '서울 마포구 양화로 3길, 리메인',
        contents: '리클라이너가 찢어진 부분이 있어서 교환하고 싶어요. 어떻게 교환할 수 있나요?',
        img: ['as_img']),
    ASApplicationHistoryModel(
        idx: 4,
        title: '리클라이너 교환 요청합니다.',
        date: '2020.10.7',
        time: '12:00',
        state: 4,
        name: '홍길동',
        phoneNumber: '010.1234.5678',
        address: '서울 마포구 양화로 3길, 리메인',
        contents: '리클라이너가 찢어진 부분이 있어서 교환하고 싶어요. 어떻게 교환할 수 있나요?',
        img: ['as_img'])
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
          _model.length,
          (index) => Padding(
                padding: EdgeInsets.only(bottom: supportUI.resWidth(20)),
                child: ASApplicationHistoryItem(
                    supportUI: supportUI,
                    jakomoColor: jakomoColor,
                    commonUI: commonUI,
                    applicationHistoryModel: _model[index]),
              )),
    );
  }
}
