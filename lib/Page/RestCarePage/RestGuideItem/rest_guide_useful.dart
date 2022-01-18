import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/HomePage/JakomoUsefulInfo/jakomo_useful_info.dart';
import 'package:jakomo_recliner/Page/HomePage/JakomoUsefulInfo/jakomo_useful_info_item.dart';
import 'package:jakomo_recliner/Page/HomePage/JakomoUsefulInfo/jakomo_useful_info_model.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class RestGuideUseful extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  RestGuideUseful({Key? key, required this.supportUI, required this.jakomoColor}):super(key: key);
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
  late final CommonUI commonUI = CommonUI(supportUI: supportUI, jakomoColor: jakomoColor);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.deviceWidth,
      decoration: BoxDecoration(
        color: jakomoColor.white,
        border: Border.all(width: 0, color: jakomoColor.white)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: supportUI.resWidth(60), bottom: supportUI.resWidth(30), left: supportUI.resWidth(30)),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: commonUI.titleWithLine('알면 유용한 건강 정보', '건강 정보'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: supportUI.resWidth(30), bottom: supportUI.resWidth(70)),
            child: SizedBox(
              width: supportUI.deviceWidth * 11 / 12,
              height: supportUI.resWidth(212),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: _infoList.length,
                  itemBuilder: (context, idx){
                    return JakomoUsefulInfoItem(
                        supportUI: supportUI,
                        jakomoColor: jakomoColor,
                        jakomoUsefulInfoModel: _infoList[idx]);
                  }),
            ),
          )
        ],
      ),
    );
  }
}
