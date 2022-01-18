import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/Page/ASApplicationPage/ASApplicationDetail/as_application_detail_answer.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import '../as_application_history_model.dart';

class ASApplicationDetailContents extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final ASApplicationHistoryModel applicationHistoryModel;
  final CommonUI commonUI;
  ASApplicationDetailContents(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
        required this.commonUI,
      required this.applicationHistoryModel})
      : super(key: key);
  late final TextStyle _replacementTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontNanum('r'));
  late final TextStyle _titleTextStyle = TextStyle(
      color: jakomoColor.black,
      fontSize: supportUI.resFontSize(16),
      fontFamily: supportUI.fontNanum('b'),
      fontWeight: FontWeight.bold);
  late final TextStyle _headTextStyle1 = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: supportUI.resFontSize(13),
      color: jakomoColor.pistachio,
      fontFamily: supportUI.fontPoppings('semibold'));
  late final TextStyle _headTextStyle2 = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: supportUI.resFontSize(13),
      color: jakomoColor.pistachio,
      fontFamily: supportUI.fontNanum('eb'));
  late final TextStyle _itemNumberTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontFamily: supportUI.fontPoppings('regular'),
      fontSize: supportUI.resFontSize(14));
  late final TextStyle _itemKoreanTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontFamily: supportUI.fontNanum('r'),
      fontSize: supportUI.resFontSize(14));

  late final TextStyle _contentsTextStyle = TextStyle(
    color: jakomoColor.boulder,
    fontSize: supportUI.resFontSize(14),
    fontFamily: supportUI.fontNanum('r'),
    height: 1.7
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.deviceWidth * 8 / 9,
      decoration: BoxDecoration(
          color: jakomoColor.athensGray,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: supportUI.resWidth(31), left: supportUI.resWidth(20)),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                '교환',
                style: _replacementTextStyle,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: supportUI.resWidth(20)),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                applicationHistoryModel.title,
                style: _titleTextStyle,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: supportUI.resWidth(20), top: supportUI.resWidth(5)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: supportUI.resWidth(12)),
                      child: Text.rich(TextSpan(children: [
                        TextSpan(text: 'AS ', style: _headTextStyle1),
                        TextSpan(text: '방문일', style: _headTextStyle2)
                      ])),
                    ),
                    Text(
                      applicationHistoryModel.date,
                      style: _itemNumberTextStyle,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: supportUI.resWidth(8)),
                      child: Container(
                        width: supportUI.resWidth(1),
                        height: supportUI.resWidth(9),
                        color: jakomoColor.boulder.withOpacity(0.3),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: supportUI.resWidth(4)),
                      child: Text(
                        '오후',
                        style: _itemKoreanTextStyle,
                      ),
                    ),
                    Text(
                      applicationHistoryModel.time,
                      style: _itemNumberTextStyle,
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: supportUI.resWidth(4),
                      bottom: supportUI.resWidth(6)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: supportUI.resWidth(17)),
                        child: Text(
                          '신청 정보',
                          style: _headTextStyle2,
                        ),
                      ),
                      Text(
                        applicationHistoryModel.name,
                        style: _itemKoreanTextStyle,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: supportUI.resWidth(8)),
                        child: Container(
                          width: supportUI.resWidth(1),
                          height: supportUI.resWidth(9),
                          color: jakomoColor.boulder.withOpacity(0.3),
                        ),
                      ),
                      Text(
                        applicationHistoryModel.phoneNumber,
                        style: _itemNumberTextStyle,
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: supportUI
                              .getTextSize('신청 정보', _headTextStyle2)
                              .width +
                          supportUI.resWidth(17),
                    ),
                    Text(
                      applicationHistoryModel.address,
                      style: _itemKoreanTextStyle,
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: supportUI.resWidth(24), bottom: supportUI.resWidth(20)),
            child: Center(
              child: SizedBox(
                width: supportUI.deviceWidth * 7 / 9,
                height: supportUI.resWidth(1),
                child: DottedLine(
                  direction: Axis.horizontal,
                  lineLength: supportUI.deviceWidth * 7 / 9,
                  lineThickness: 1.0,
                  dashLength: supportUI.resWidth(4),
                  dashColor: jakomoColor.manatee.withOpacity(0.2),
                  dashGapColor: jakomoColor.transperent,
                ),
              ),
            ),
          ),
          SizedBox(
            width: supportUI.deviceWidth * 7 / 9,
            child: Text(
              applicationHistoryModel.contents,
              style: _contentsTextStyle,
              softWrap: true,
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                  top: supportUI.resWidth(25),
                  bottom: supportUI.resWidth(16)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                    applicationHistoryModel.img.length,
                        (index) => Padding(
                      padding:
                      EdgeInsets.only(bottom: supportUI.resWidth(5)),
                      child: Container(
                        width: supportUI.deviceWidth * 7 / 9,
                        height: supportUI.resWidth(175),
                        decoration: BoxDecoration(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(4)),
                            image: DecorationImage(
                                image: AssetImage(
                                    'images/${applicationHistoryModel.img[index]}.png'),
                                fit: BoxFit.fill)),
                      ),
                    )),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                right: supportUI.resWidth(20), bottom: supportUI.resWidth(21)),
            child: Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: commonUI.convertState(applicationHistoryModel.state),
            ),
          ),
          applicationHistoryModel.state != 3
              ? ASApplicationDetailAnswer(
                  supportUI: supportUI,
                  jakomoColor: jakomoColor,
                  applicationHistoryModel: applicationHistoryModel)
              : Container()
        ],
      ),
    );
  }

}
