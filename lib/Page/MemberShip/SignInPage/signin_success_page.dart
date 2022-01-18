import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Routes/jakomo_routes.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class SignInSuccess extends StatelessWidget {
  final SupportUI supportUI = SupportUI();
  final JakomoColor jakomoColor = JakomoColor();
  late final CommonUI commonUI =
      CommonUI(supportUI: supportUI, jakomoColor: jakomoColor);

  SignInSuccess({Key? key}) : super(key: key);
  late final TextStyle _titleTextStyle = TextStyle(
      color: jakomoColor.black,
      fontWeight: FontWeight.bold,
      fontFamily: supportUI.fontNanum('eb'),
      fontSize: supportUI.resFontSize(24),
      height: 1.5);
  late final TextStyle _textStyle = TextStyle(
      color: jakomoColor.boulder,
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontNanum('r'),
      fontWeight: FontWeight.w400);
  late final TextStyle _textStyle2 = TextStyle(
      color: jakomoColor.white,
      fontWeight: FontWeight.w900,
      fontFamily: supportUI.fontNanum('b'),
      fontSize: supportUI.resFontSize(14));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: jakomoColor.white,
      body: WillPopScope(
        onWillPop: () {
          Get.toNamed(JakomoRoutes.login);
          return Future(() => false);
        },
        child: SizedBox(
          width: supportUI.deviceWidth,
          height: supportUI.deviceHeight,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional.topStart,
                child: SizedBox(
                  width: supportUI.deviceWidth,
                  child: Image.asset(
                    'images/short_banner_img.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomStart,
                child: Container(
                  width: supportUI.deviceWidth,
                  height: supportUI.deviceHeight * 2 / 3,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: jakomoColor.white),
                  child: Padding(
                    padding: EdgeInsets.only(left: supportUI.commonLeft()),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: supportUI.resWidth(46),
                                  bottom: supportUI.resWidth(18)),
                              child: Align(
                                alignment: AlignmentDirectional.topStart,
                                child: SizedBox(
                                  height: supportUI.resHeight(32),
                                  child: Image.asset(
                                    'images/logo_icon.png',
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: supportUI.resHeight(8)),
                              child: Align(
                                alignment: AlignmentDirectional.topStart,
                                child: Text(
                                  '회원가입이\n완료되었습니다.',
                                  style: _titleTextStyle,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional.topStart,
                              child: Text(
                                '앱을 통해 더 많은 서비스를 이용해보세요.',
                                style: _textStyle,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(bottom: supportUI.resHeight(24)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () => Get.toNamed(JakomoRoutes.home),
                                child: commonUI.concreteButton('홈으로 가기'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: supportUI.resWidth(8)),
                                child: GestureDetector(
                                  onTap: () => Get.toNamed(JakomoRoutes.login),
                                  child: Container(
                                    width: supportUI.resWidth(148),
                                    height: supportUI.resWidth(52),
                                    decoration: BoxDecoration(
                                        color: jakomoColor.pistachio,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(28)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: jakomoColor.grey
                                                .withOpacity(0.2),
                                            spreadRadius: 3,
                                            blurRadius: 10,
                                          ),
                                        ]),
                                    child: Center(
                                      child: Text(
                                        '로그인 하기',
                                        style: _textStyle2,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
