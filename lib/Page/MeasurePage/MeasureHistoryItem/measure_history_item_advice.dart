import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class MeasureHistoryItemAdvice extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final String advice;
  MeasureHistoryItemAdvice(
      {Key? key, required this.supportUI, required this.jakomoColor, required this.advice})
      : super(key: key);
  late final TextStyle _titleTextStyle = TextStyle(
      color: jakomoColor.yukonGold,
      fontSize: supportUI.resFontSize(13),
      fontFamily: supportUI.fontNanum('eb'),
      fontWeight: FontWeight.bold);
  late final TextStyle _contentsTextStyle = TextStyle(
      height: 1.6,
      color: jakomoColor.mineShaft2,
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontNanum('r'));
  final String dummyContent = '과로에 의한 만성스트레스 상태로 보여집니다. 하루에 최소 2~3번 가벼운 산책이나 명상 등의 휴식을 취하시기 바랍니다.';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.deviceWidth * 13 / 18,
      height: supportUI.resHeight(150),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: jakomoColor.alto.withOpacity(0.2)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: supportUI.resWidth(16), top: supportUI.resHeight(15), bottom: supportUI.resHeight(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'images/info_icon.png',
                    width: supportUI.resWidth(18),
                    height: supportUI.resHeight(18),
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: supportUI.resWidth(3)),
                    child: SizedBox(
                      height: supportUI.resHeight(18),
                      child: Center(
                        child: Text(
                          '어드바이스',
                          style: _titleTextStyle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: supportUI.resWidth(225),
              height: supportUI.resHeight(96),
              child: Text(
                advice,
                  style: _contentsTextStyle,
                textAlign: TextAlign.start,
                softWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
