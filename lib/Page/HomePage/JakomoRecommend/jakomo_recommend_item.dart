import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/Page/HomePage/JakomoRecommend/jakomo_recommend_image.dart';
import 'package:jakomo_recliner/Page/HomePage/JakomoRecommend/jakomo_recommend_model.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class JakomoRecommendItem extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final JakomoRecommendModel jakomoRecommendModel;
  final TextStyle newTextStyle;
  final TextStyle titleTextStyle;
  final TextStyle moveTextStyle;
  const JakomoRecommendItem(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.jakomoRecommendModel,
      required this.newTextStyle,
        required this.titleTextStyle,
      required this.moveTextStyle,
      })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        JakomoRecommendImage(supportUI: supportUI, jakomoColor: jakomoColor, img: jakomoRecommendModel.recommendImg, newTextStyle: newTextStyle),
        Padding(
          padding: EdgeInsets.only(top: supportUI.resHeight(20), bottom: supportUI.resWidth(10)),
          child: SizedBox(
            width: supportUI.resWidth(260),
            child: Text(jakomoRecommendModel.title, style: titleTextStyle, softWrap: true,textAlign: TextAlign.center,),
          ),
        ),
        SizedBox(
          width: supportUI.resWidth(260),
          child: Center(
            child: Text('구매하러가기', style: moveTextStyle,),
          ),
        )
      ],
    );
  }
}
