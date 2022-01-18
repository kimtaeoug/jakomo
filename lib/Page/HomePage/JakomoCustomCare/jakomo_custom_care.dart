import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/HomePage/JakomoCustomCare/jakomo_custom_care_item.dart';
import 'package:jakomo_recliner/Page/HomePage/JakomoCustomCare/jakomo_custom_care_model.dart';
import 'package:jakomo_recliner/Routes/jakomo_routes.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class JakomoCustomCare extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  JakomoCustomCare(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);
  final List<JakomoCustomCareModel> _careList = [
    JakomoCustomCareModel(
        title: '주말 오후 휴식을 원하는 분께 추천',
        contents: '만천하의 싹이 심장의 약동하다. 어디\n할지라도 때까지 몸이 귀는 고동을 청춘의 ...',
        img: 'images/guide_img_1.png',
        tagList: ['주말', '오후']),
    JakomoCustomCareModel(
        title: '주말 오후 휴식을 원하는 분께 추천',
        contents: '만천하의 싹이 심장의 약동하다. 어디\n할지라도 때까지 몸이 귀는 고동을 청춘의 ...',
        img: 'images/guide_img_2.png',
        tagList: ['주말', '오후']),
    JakomoCustomCareModel(
        title: '주말 오후 휴식을 원하는 분께 추천',
        contents: '만천하의 싹이 심장의 약동하다. 어디\n할지라도 때까지 몸이 귀는 고동을 청춘의 ...',
        img: 'images/guide_img_3.png',
        tagList: ['주말', '오후'])
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.deviceWidth,
      decoration: BoxDecoration(
        color: jakomoColor.white,
        border: Border.all(color: jakomoColor.white, width: 0)
      ),
      child: Padding(
        padding: EdgeInsets.only(top: supportUI.resHeight(85)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only( bottom: supportUI.resHeight(20)),
              child:
              JakomoCustomTitle(supportUI: supportUI, jakomoColor: jakomoColor),
            ),
            JakomoCustomCareItem(supportUI: supportUI, jakomoColor: jakomoColor, jakomoCustomCareModel: _careList[0]),
            Padding(
              padding: EdgeInsets.symmetric(vertical: supportUI.resHeight(20)),
              child: JakomoCustomCareItem(supportUI: supportUI, jakomoColor: jakomoColor, jakomoCustomCareModel: _careList[1]),
            ),
            JakomoCustomCareItem(supportUI: supportUI, jakomoColor: jakomoColor, jakomoCustomCareModel: _careList[2])
          ],
        ),
      ),
    );
  }
}

class JakomoCustomTitle extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  late final CommonUI commonUI = CommonUI(supportUI: supportUI, jakomoColor: jakomoColor);
  JakomoCustomTitle(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);

  late final TextStyle _seeAllTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontFamily: supportUI.fontNanum('b'),
      fontSize: supportUI.resFontSize(13),
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.underline);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: supportUI.resHeight(40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: supportUI.commonLeft()),
            child: SizedBox(
              height: supportUI.resHeight(40),
              child: Align(
                alignment: AlignmentDirectional.bottomStart,
                child: commonUI.titleWithLine('맞춤 휴식 가이드', '맞춤 휴식 가이드'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: supportUI.commonLeft()),
            child: GestureDetector(
              onTap: ()=>Get.toNamed(JakomoRoutes.rest),
              child: SizedBox(
                height: supportUI.resHeight(40),
                child: Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Text(
                    '전체보기',
                    style: _seeAllTextStyle,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}
