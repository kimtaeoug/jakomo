import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/Page/HomePage/JakomoRecommend/jakomo_recommend.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class JakomoRecommendContainer extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  const JakomoRecommendContainer(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: jakomoColor.white,
        border: Border.all(color: jakomoColor.white, width: 0)
      ),
      child: Padding(
        padding: EdgeInsets.only(top: supportUI.resHeight(120), bottom: supportUI.resWidth(80)),
        child: JakomoRecommend(supportUI: supportUI, jakomoColor: jakomoColor),
      ),
    );
  }
}


