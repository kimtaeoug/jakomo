import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/Page/HomePage/JakomoCustomCare/jakomo_custom_care_model.dart';
import 'package:jakomo_recliner/Page/HomePage/JakomoCustomCare/jakomo_custom_care_tag.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class RestGuideContets extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final JakomoCustomCareModel jakomoCustomCareModel;

  RestGuideContets(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.jakomoCustomCareModel})
      : super(key: key);
  late final TextStyle contentsTextStyle = TextStyle(
      color: jakomoColor.boulder, fontSize: supportUI.resFontSize(14), fontFamily: supportUI.fontNanum('r'));
  final String dummyData = '''
  만천하의 싹이 심장의 약동하다. 어디 할지라도 때까지 몸이 귀는 고동을 청춘의 그러므로 있을 말이다. 가진 낙원을 것은 군영과 피는 청춘은 같은 무엇을 운다. 싸인 생명을 소금이라 얼마나 철환하였는가? 하는 무엇이 위하여, 끝에 힘차게 이상 것이다. 관현악이며, 불러 얼음과 많이 속잎나고, 것은 운다. 그들은 있는 가슴에 보이는 사막이다. 품었기 피고 미인을 그들은 뿐이다. 할지니, 쓸쓸한 우는 길지 인생에 이것이다. 것은 그들의 그들은 길지 따뜻한 못할 가는 피에 부패뿐이다.
만천하의 싹이 심장의 약동하다. 어디 할지라도 때까지 몸이 귀는 고동을 청춘의 그러므로 있을 말이다. 가진 낙원을 것은 군영과 피는 청춘은 같은 무엇을 운다. 싸인 생명을 소금이라 얼마나 철환하였는가? 하는 무엇이 위하여, 끝에 힘차게 이상 것이다. 관현악이며, 불러 얼음과 많이 속잎나고, 것은 운다. 그들은 있는 가슴에 보이는 사막이다. 품었기 피고 미인을 그들은 뿐이다. 할지니, 쓸쓸한 우는 길지 인생에 이것이다. 것은 그들의 그들은 길지 따뜻한 못할 가는 피에 부패뿐이다.
  ''';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.deviceWidth,
      decoration: BoxDecoration(
        color: jakomoColor.white,
        borderRadius: const BorderRadius.vertical(top:Radius.circular(20) )
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: supportUI.resWidth(61)),
                child: SizedBox(
                  width: supportUI.deviceWidth*5/6,
                  child: Text(
                    dummyData,
                    style: contentsTextStyle,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: supportUI.resWidth(28), bottom: supportUI.resWidth(48), left: supportUI.resWidth(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                    jakomoCustomCareModel.tagList.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(right: supportUI.resWidth(4)),
                          child: JakomoCustomCareTag(
                              supportUI: supportUI,
                              jakomoColor: jakomoColor,
                              tag: jakomoCustomCareModel.tagList[index]),
                        )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
