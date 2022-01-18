import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/HomePage/JakomoRecommend/jakomo_auto_swipe.dart';
import 'package:jakomo_recliner/Page/HomePage/JakomoRecommend/jakomo_recommend_model.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class JakomoRecommend extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  late final CommonUI commonUI = CommonUI(supportUI: supportUI, jakomoColor: jakomoColor);
  JakomoRecommend(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);
  final List<JakomoRecommendModel> recommedList = [
    JakomoRecommendModel(
        recommendImg: 'images/recommanded_chair.png',
        title: '카이저 1인 리클라이너\n슈렁큰 천연모피 소가죽 체어'),
    JakomoRecommendModel(
        recommendImg: 'images/recommanded_chair.png',
        title: '카이저 1인 리클라이너\n슈렁큰 천연모피 소가죽 체어'),
    JakomoRecommendModel(
        recommendImg: 'images/recommanded_chair.png',
        title: '카이저 1인 리클라이너\n슈렁큰 천연모피 소가죽 체어')
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: supportUI.resWidth(30), bottom: supportUI.resWidth(20)),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: commonUI.titleWithLine('자코모 추천 아이템', '아이템'),
          ),
        ),
        JakomoAutoSwipe(
            supportUI: supportUI,
            jakomoColor: jakomoColor,
            recommedList: recommedList)
      ],
    );
  }
}
