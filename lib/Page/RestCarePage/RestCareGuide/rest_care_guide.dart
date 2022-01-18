import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/Page/HomePage/JakomoCustomCare/jakomo_custom_care_item.dart';
import 'package:jakomo_recliner/Page/HomePage/JakomoCustomCare/jakomo_custom_care_model.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class RestCareGuide extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  RestCareGuide({Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);
  late final TextStyle _titleTextStyle = TextStyle(
    fontFamily: supportUI.fontNanum('r'),
    color: jakomoColor.boulder,
    fontSize: supportUI.resFontSize(12),
  );
  final List<JakomoCustomCareModel> _careList = [
    JakomoCustomCareModel(
        title: '주말 오후 휴식을 원하는 분꼐 추천',
        contents: '만천하의 싹이 심장의 약동하다. 어디\n할지라도 때까지 몸이 귀는 고동을 청춘의 ...',
        img: 'images/guide_img_1.png',
        tagList: ['주말', '오후']),
    JakomoCustomCareModel(
        title: '주말 오후 휴식을 원하는 분꼐 추천',
        contents: '만천하의 싹이 심장의 약동하다. 어디\n할지라도 때까지 몸이 귀는 고동을 청춘의 ...',
        img: 'images/guide_img_2.png',
        tagList: ['주말', '오후']),
    JakomoCustomCareModel(
        title: '주말 오후 휴식을 원하는 분꼐 추천',
        contents: '만천하의 싹이 심장의 약동하다. 어디\n할지라도 때까지 몸이 귀는 고동을 청춘의 ...',
        img: 'images/guide_img_3.png',
        tagList: ['주말', '오후']),
    JakomoCustomCareModel(
        title: '주말 오후 휴식을 원하는 분꼐 추천',
        contents: '만천하의 싹이 심장의 약동하다. 어디\n할지라도 때까지 몸이 귀는 고동을 청춘의 ...',
        img: 'images/guide_img_1.png',
        tagList: ['주말', '오후']),
    JakomoCustomCareModel(
        title: '주말 오후 휴식을 원하는 분꼐 추천',
        contents: '만천하의 싹이 심장의 약동하다. 어디\n할지라도 때까지 몸이 귀는 고동을 청춘의 ...',
        img: 'images/guide_img_2.png',
        tagList: ['주말', '오후']),
    JakomoCustomCareModel(
        title: '주말 오후 휴식을 원하는 분꼐 추천',
        contents: '만천하의 싹이 심장의 약동하다. 어디\n할지라도 때까지 몸이 귀는 고동을 청춘의 ...',
        img: 'images/guide_img_3.png',
        tagList: ['주말', '오후'])
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: supportUI.commonLeft(), bottom: supportUI.resWidth(40), top: supportUI.resWidth(17.5)),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              '자코모가 추천해드리는 휴식 가이드',
              style: _titleTextStyle,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: supportUI.resHeight(120)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
                _careList.length,
                    (index) => Padding(
                  padding: EdgeInsets.only(bottom: supportUI.resWidth(20)),
                  child: JakomoCustomCareItem(
                      supportUI: supportUI,
                      jakomoColor: jakomoColor,
                      jakomoCustomCareModel: _careList[index]),
                )),
          ),
        )
      ],
    );
  }
}
