import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class PersonalPolicyPage extends StatelessWidget {
  final SupportUI supportUI = SupportUI();
  final JakomoColor jakomoColor = JakomoColor();

  PersonalPolicyPage({Key? key}) : super(key: key);
  late final TextStyle _textStyle = TextStyle(
      color: jakomoColor.black,
      fontSize: supportUI.resFontSize(24),
      fontFamily: supportUI.fontNanum('eb'),
      fontWeight: FontWeight.bold);
  late final TextStyle _textStyle2 = TextStyle(
    color: jakomoColor.boulder,
    fontSize: supportUI.resFontSize(14),
    fontFamily: supportUI.fontNanum('r'),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: jakomoColor.white,
          body: WillPopScope(
            onWillPop: () {
              Get.back();
              return Future(() => false);
            },
            child: SizedBox(
              width: supportUI.deviceWidth,
              height: supportUI.deviceHeight,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: supportUI.resWidth(24),
                          top: supportUI.resHeight(21),
                          bottom: supportUI.resHeight(35)),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: SizedBox(
                            width: supportUI.resWidth(9),
                            height: supportUI.resHeight(15),
                            child: Image.asset('images/back_icon.png'),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: supportUI.commonLeft(),
                          bottom: supportUI.resHeight(15)),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Text(
                          '개인정보수집약관',
                          style: _textStyle,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: supportUI.commonLeft()),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: SizedBox(
                          width: supportUI.deviceWidth * 5 / 6,
                          child: Text(
                            _longText,
                            style: _textStyle2,
                            softWrap: true,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  final String _longText = '만천하의 싹이 심장의 약동하다. 어디 할지라도 때까지 몸이 귀는 고동을 청춘의 그러므로 있을 말이다. 가진 낙원을 것은 군영과 피는 청춘은 같은 무엇을 운다. 싸인 생명을 소금이라 얼마나 철환하였는가? 하는 무엇이 위하여, 끝에 힘차게 이상 것이다. 관현악이며, 불러 얼음과 많이 속잎나고, 것은 운다. 그들은 있는 가슴에 보이는 사막이다. 품었기 피고 미인을 그들은 뿐이다. 할지니, 쓸쓸한 우는 길지 인생에 이것이다. 것은 그들의 그들은 길지 따뜻한 못할 가는 피에 부패뿐이다.만천하의 싹이 심장의 약동하다. 어디 할지라도 때까지 몸이 귀는 고동을 청춘의 그러므로 있을 말이다. 가진 낙원을 것은 군영과 피는 청춘은 같은 무엇을 운다. 싸인 생명을 소금이라 얼마나 철환하였는가? 하는 무엇이 위하여, 끝에 힘차게 이상 것이다. 관현악이며, 불러 얼음과 많이 속잎나고, 것은 운다. 그들은 있는 가슴에 보이는 사막이다. 품었기 피고 미인을 그들은 뿐이다. 할지니, 쓸쓸한 우는 길지 인생에 이것이다. 것은 그들의 그들은 길지 따뜻한 못할 가는 피에 부패뿐이다.';
}
