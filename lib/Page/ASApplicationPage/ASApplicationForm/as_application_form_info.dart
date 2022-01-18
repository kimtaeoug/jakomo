import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class ASApplicationFormInfo extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  ASApplicationFormInfo(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);

  late final TextStyle _titleEnTextStyle = TextStyle(
      fontSize: supportUI.resFontSize(16),
      color: jakomoColor.mineShaft,
      fontWeight: FontWeight.bold,
      fontFamily: supportUI.fontPoppings('semibold'));
  late final TextStyle _titleKrTextStyle = TextStyle(
      fontSize: supportUI.resFontSize(16),
      color: jakomoColor.mineShaft,
      fontWeight: FontWeight.bold,
      fontFamily: supportUI.fontNanum('eb'));
  late final TextStyle _hintTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontFamily: supportUI.fontNanum('r'),
      fontSize: supportUI.resFontSize(14),
      fontWeight: FontWeight.w400);
  late final TextStyle _inputTextStyle = TextStyle(
      color: jakomoColor.black,
      fontFamily: supportUI.fontNanum('r'),
      fontSize: supportUI.resFontSize(14),
      fontWeight: FontWeight.w400);
  late final TextStyle _addressTextStyle = TextStyle(
      color: jakomoColor.mineShaft,
      fontFamily: supportUI.fontNanum('b'),
      fontSize: supportUI.resFontSize(10),
      fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: supportUI.commonLeft(), bottom: supportUI.resWidth(16)),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: Text.rich(TextSpan(children: [
              TextSpan(text: 'AS ', style: _titleEnTextStyle),
              TextSpan(text: '방문 정보', style: _titleKrTextStyle)
            ])),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: supportUI.resWidth(12)),
          child: Center(
            child: Container(
              width: supportUI.deviceWidth * 5 / 6,
              height: supportUI.resWidth(56),
              decoration: BoxDecoration(
                  color: jakomoColor.white,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  border: Border.all(color: jakomoColor.gallery, width: 2)),
              child: Center(
                child: SizedBox(
                  width: supportUI.deviceWidth * 5 / 6 - supportUI.resWidth(40),
                  child: Center(
                    child: TextField(
                      style: _inputTextStyle,
                      cursorColor: jakomoColor.silver,
                      decoration: InputDecoration(
                          labelText: 'AS 신청인',
                          labelStyle: _hintTextStyle,
                          border: InputBorder.none,
                          isDense: true),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: supportUI.resWidth(12)),
          child: Center(
            child: Container(
              width: supportUI.deviceWidth * 5 / 6,
              height: supportUI.resWidth(56),
              decoration: BoxDecoration(
                  color: jakomoColor.white,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  border: Border.all(color: jakomoColor.gallery, width: 2)),
              child: Center(
                child: SizedBox(
                  width: supportUI.deviceWidth * 5 / 6 - supportUI.resWidth(40),
                  child: TextField(
                    style: _inputTextStyle,
                    keyboardType: TextInputType.phone,
                    cursorColor: jakomoColor.silver,
                    decoration: InputDecoration(
                        labelText: '휴대폰 번호',
                        labelStyle: _hintTextStyle,
                        border: InputBorder.none,
                        isDense: true),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: supportUI.resWidth(12)),
          child: Center(
            child: Container(
              width: supportUI.deviceWidth * 5 / 6,
              height: supportUI.resWidth(56),
              decoration: BoxDecoration(
                  color: jakomoColor.white,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  border: Border.all(color: jakomoColor.gallery, width: 2)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: supportUI.resWidth(20)),
                      child: SizedBox(
                        width: supportUI.resWidth(200),
                        child: TextFormField(
                          initialValue: '서울 마포구',
                          style: _inputTextStyle,
                          decoration: InputDecoration(
                              labelText: '주소',
                              labelStyle: _hintTextStyle,
                              border: InputBorder.none,
                              isDense: true),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.only(right: supportUI.resWidth(10)),
                        child: Container(
                          width: supportUI.resWidth(65),
                          height: supportUI.resWidth(36),
                          decoration: BoxDecoration(
                              color: jakomoColor.athensGray,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4))),
                          child: Center(
                            child: Text(
                              '주소검색',
                              style: _addressTextStyle,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: supportUI.resWidth(32)),
          child: Center(
            child: Container(
              width: supportUI.deviceWidth * 5 / 6,
              height: supportUI.resWidth(56),
              decoration: BoxDecoration(
                  color: jakomoColor.white,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  border: Border.all(color: jakomoColor.gallery, width: 2)),
              child: Center(
                child: SizedBox(
                  width: supportUI.deviceWidth * 5 / 6 - supportUI.resWidth(40),
                  child: Center(
                    child: TextField(
                      style: _inputTextStyle,
                      decoration: InputDecoration(
                          labelText: '세부 주소 입력',
                          labelStyle: _hintTextStyle,
                          border: InputBorder.none,
                          isDense: true),
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
