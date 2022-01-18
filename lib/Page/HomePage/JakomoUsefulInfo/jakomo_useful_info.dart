import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/HomePage/JakomoUsefulInfo/jakomo_useful_info_all.dart';
import 'package:jakomo_recliner/Page/HomePage/JakomoUsefulInfo/jakomo_useful_info_item.dart';
import 'package:jakomo_recliner/Page/HomePage/JakomoUsefulInfo/jakomo_useful_info_model.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class JakomoUsefulInfo extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  late final CommonUI commonUI = CommonUI(supportUI: supportUI, jakomoColor: jakomoColor);
  JakomoUsefulInfo(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);
  late final List<JakomoUsefulInfoModel> _infoList = [
    JakomoUsefulInfoModel(
        infoImage: 'images/guide_img_1.png',
        infoTitle: '주말 오후 휴식을\n원하는 분께 추천',
        infoContents: '휴식 가이드',
        infoColor: jakomoColor.domino),
    JakomoUsefulInfoModel(
        infoImage: 'images/guide_img_1.png',
        infoTitle: '주말 오후 휴식을\n원하는 분께 추천',
        infoContents: '휴식 오디오',
        infoColor: jakomoColor.capeCod)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.deviceWidth,
      height: supportUI.resWidth(267),
      decoration: BoxDecoration(
          color: jakomoColor.white,
          border: Border.all(color: jakomoColor.white, width: 0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Padding(
              padding: EdgeInsets.only(left: supportUI.resWidth(30)),
              child: commonUI.titleWithLine('알면 유용한 건강 정보', '건강 정보'),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: SizedBox(
              width: supportUI.deviceWidth * 11 / 12,
              height: supportUI.resWidth(212),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: _infoList.length+1,
                itemBuilder: (context, idx) {
                  if (idx == _infoList.length) {
                    return JakomoUsefulInfoAll(
                        supportUI: supportUI, jakomoColor: jakomoColor);
                  } else {
                    return JakomoUsefulInfoItem(
                        supportUI: supportUI,
                        jakomoColor: jakomoColor,
                        jakomoUsefulInfoModel: _infoList[idx]);
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

