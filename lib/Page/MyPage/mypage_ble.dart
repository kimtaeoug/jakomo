import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/BLEConnectionPage/ble_connection_guide.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class MyPageBLE extends StatelessWidget {
  final SupportUI supportUI = SupportUI();
  final JakomoColor jakomoColor = JakomoColor();
  late final CommonUI commonUI =
      CommonUI(supportUI: supportUI, jakomoColor: jakomoColor);

  MyPageBLE({
    Key? key,
  }) : super(key: key);
  late final TextStyle textStyle = TextStyle(
      color: jakomoColor.mineShaft,
      fontFamily: supportUI.fontNanum('b'),
      fontSize: supportUI.resFontSize(10),
      fontWeight: FontWeight.w400);

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              commonUI.pageTop('제품 연결 관리', ''),
              Expanded(
                  child: Container(
                width: supportUI.deviceWidth,
                decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(20)),
                    color: jakomoColor.alabaster),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: supportUI.resHeight(28)),
                      child: Center(
                        child: commonUI.bleConnection(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: supportUI.resWidth(12),
                          left: supportUI.commonLeft()),
                      child: BLEConnectionGuide(
                          supportUI: supportUI, jakomoColor: jakomoColor),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: supportUI.resWidth(27.5)),
                      child: Center(
                        child: Container(
                          width: supportUI.deviceWidth * 5 / 6,
                          height: supportUI.resHeight(1),
                          color: jakomoColor.gallery2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: supportUI.resHeight(17),
                          bottom: supportUI.resHeight(12)),
                      child: SizedBox(
                        width: supportUI.deviceWidth * 5 / 6,
                        child: Align(
                          alignment: AlignmentDirectional.bottomStart,
                          child: Container(
                            width: supportUI.resWidth(65),
                            height: supportUI.resHeight(36),
                            decoration: BoxDecoration(
                                color: jakomoColor.white,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(4))),
                            child: Center(
                              child: Text(
                                '편집',
                                style: textStyle,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: supportUI.resHeight(12)
                      ),
                      child: Center(
                        child: MyPageBLEConnection(supportUI: supportUI, jakomoColor: jakomoColor),
                      ),
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    ));
  }
}

class MyPageBLEConnection extends StatefulWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  const MyPageBLEConnection(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyPageBLEConnection();
}

class _MyPageBLEConnection extends State<MyPageBLEConnection> {
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  final String _popupText = '카이저 1인 리클라이너\n슈렁큰 천연면피 소가죽 체어';
  late final TextStyle _popupTextStyle = TextStyle(
      color: jakomoColor.black,
      fontWeight: FontWeight.bold,
      fontSize: supportUI.resFontSize(12),
      fontFamily: supportUI.fontNanum('b'),
      height: 1.6);
  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.deviceWidth * 5 / 6,
      height: supportUI.resWidth(84),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: jakomoColor.white,
          boxShadow: [
            BoxShadow(
              color: jakomoColor.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 10,
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: supportUI.resWidth(16)),
            child: SizedBox(
              width: supportUI.resWidth(44),
              height: supportUI.resWidth(44),
              child: Image.asset('images/control_popup_img.png'),
            ),
          ),
          SizedBox(
            width: supportUI.deviceWidth * 5 / 6 - supportUI.resWidth(120),
            height: supportUI.resWidth(44),
            child: Padding(
              padding: EdgeInsets.only(left: supportUI.resWidth(16)),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  _popupText,
                  style: _popupTextStyle,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: supportUI.resWidth(16)),
            child: SizedBox(
              width: supportUI.resWidth(40),
              height: supportUI.resWidth(24),
              child: _switch(),
            ),
          )
        ],
      ),
    );
  }

  Widget _switch() {
    return GestureDetector(
      onTap: () => setState(() {
        clicked = !clicked;
      }),
      child: Container(
        width: supportUI.resWidth(40),
        height: supportUI.resWidth(24),
        decoration: BoxDecoration(
          color: clicked ? jakomoColor.chambray : jakomoColor.silver,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Center(
          child: SizedBox(
            width: supportUI.resWidth(32),
            height: supportUI.resWidth(16),
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 300),
              alignment: clicked
                  ? AlignmentDirectional.centerEnd
                  : AlignmentDirectional.centerStart,
              child: Container(
                width: supportUI.resWidth(16),
                height: supportUI.resWidth(16),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: jakomoColor.white,
                    boxShadow: [
                      BoxShadow(
                        color: jakomoColor.grey.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 10,
                        // offset: const Offset(4.0, 2.0)
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
