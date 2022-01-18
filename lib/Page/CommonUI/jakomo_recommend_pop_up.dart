import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/Popup/pop_up_controller.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class JakomoRecommendPopUp extends StatefulWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  const JakomoRecommendPopUp({
    Key? key,
    required this.supportUI,
    required this.jakomoColor,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _JakomoRecommendPopUp();
}

class _JakomoRecommendPopUp extends State<JakomoRecommendPopUp> {
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  late final TextStyle _titleTextStyle = TextStyle(
      fontSize: supportUI.resFontSize(14),
      color: jakomoColor.white,
      fontWeight: FontWeight.bold,
      fontFamily: supportUI.fontNanum('b'));
  late final TextStyle _contentsTextStyle = TextStyle(
      fontSize: supportUI.resFontSize(12),
      color: jakomoColor.white.withOpacity(0.8),
      fontFamily: supportUI.fontNanum('r'));
  late final TextStyle _bottomTextStyle = TextStyle(
      fontSize: supportUI.resFontSize(12),
      color: jakomoColor.white,
      fontWeight: FontWeight.bold,
      fontFamily: supportUI.fontNanum('b'),
      decoration: TextDecoration.underline);
  final PopUpController popUpController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return !popUpController.close.value
          ? Container(
              width: supportUI.deviceWidth * 5 / 6,
              height: supportUI.resHeight(90),
              decoration: BoxDecoration(
                  color: jakomoColor.emperor,
                  borderRadius: const BorderRadius.all(Radius.circular(12))),
              child: Padding(
                padding: EdgeInsets.only(left: supportUI.resWidth(20)),
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: supportUI.resHeight(12)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              popUpController.title.value == ''
                                  ? '추천 휴식 가이드'
                                  : popUpController.title.value,
                              style: _titleTextStyle,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: supportUI.resWidth(20)),
                              child: GestureDetector(
                                onTap: () {
                                  popUpController.close.value = true;
                                },
                                child: SizedBox(
                                  width: supportUI.resWidth(20),
                                  height: supportUI.resHeight(20),
                                  child: Image.asset('images/close_icon.png'),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Text(
                          popUpController.contents.value == ''
                              ? '달콤한 낮잠으로 오후의 활력을 얻으세요.'
                              : popUpController.contents.value,
                          style: _contentsTextStyle,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: supportUI.resHeight(15)),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text(
                            popUpController.bottom.value == ''
                                ? '수면 기능 바로가기'
                                : popUpController.bottom.value,
                            style: _bottomTextStyle,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          : Container();
    });
  }
}
