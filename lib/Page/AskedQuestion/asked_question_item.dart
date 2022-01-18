import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'asked_question_model.dart';

class AskedquestionItem extends StatefulWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final AskedquestionModel askedquestionModel;

  const AskedquestionItem(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.askedquestionModel})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _AskedquestionItem();
}

class _AskedquestionItem extends State<AskedquestionItem> {
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  late final AskedquestionModel askedquestionModel = widget.askedquestionModel;

  late final TextStyle _tagTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontNanum('r'));
  late final TextStyle _titleTextStyle = TextStyle(
      color: jakomoColor.black,
      fontFamily: supportUI.fontNanum('eb'),
      fontSize: supportUI.resFontSize(16));
  late final TextStyle _foldTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontFamily: supportUI.fontNanum('b'),
      fontSize: supportUI.resFontSize(10));
  late final TextStyle _contentsTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontNanum('r'));

  bool _clicked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: askedquestionModel.idx == 4
            ? supportUI.resWidth(164)
            : supportUI.resWidth(16),
      ),
      child: Container(
        width: supportUI.deviceWidth * 8 / 9,
        decoration: BoxDecoration(
            color: jakomoColor.athensGray,
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: supportUI.resWidth(25),
                  left: supportUI.resWidth(20),
                  bottom: supportUI.resWidth(2)),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  askedquestionModel.tag,
                  style: _tagTextStyle,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: supportUI.resWidth(20),
                  bottom: supportUI.resWidth(34)),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  askedquestionModel.title,
                  style: _titleTextStyle,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: supportUI.resWidth(20),
                  bottom: supportUI.resWidth(25)),
              child: Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _clicked = !_clicked;
                    });
                  },
                  child: _fold(_clicked ? '접기' : '보기'),
                ),
              ),
            ),
            AnimatedContainer(
              width: supportUI.deviceWidth * 8 / 9,
              height: _clicked
                  ? supportUI
                          .getTextSize(_dummyAnswer, _contentsTextStyle)
                          .height +
                      supportUI.resWidth(49)
                  : 0,
              curve: Curves.linear,
              duration: const Duration(milliseconds: 500),
              child: FutureBuilder(
                future: Future.delayed(const Duration(milliseconds: 500)),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: DottedLine(
                            direction: Axis.horizontal,
                            lineLength: supportUI.deviceWidth * 7 / 9,
                            lineThickness: 1.0,
                            dashLength: supportUI.resWidth(4),
                            dashColor: jakomoColor.manatee.withOpacity(0.2),
                            dashGapColor: jakomoColor.transperent,
                          ),
                        ),
                        Center(
                          child: Text(
                            _dummyAnswer,
                            style: _contentsTextStyle,
                          ),
                        ),
                        SizedBox(
                          height: supportUI.resWidth(1),
                        )
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _fold(String input) {
    return Container(
      width: supportUI.resWidth(40),
      height: supportUI.resWidth(20),
      color: jakomoColor.white,
      child: Center(
        child: Text(
          input,
          style: _foldTextStyle,
        ),
      ),
    );
  }

  final String _dummyAnswer =
      '변경된 이용약관은 시행일 2021년 4월 7일부터\n효력이 발생합니다. 변경되는 이용약관에 대해\n시행일 전까지 거부 의사를 표시하지 않으면\n변경에 동의한 것으로 간주합니다.\n변경된 이용약관은 시행일 부터 효력이\n발생합니다. 변경되는 이용약관에 대해 시행일\n전까지 거부 의사를 표시하지 않으면 변경에\n동의한 것으로 간주합니다. ';
}
