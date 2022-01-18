import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class InquiryFormTitle extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  InquiryFormTitle(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);
  late final TextStyle _hintTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontFamily: supportUI.fontNanum('r'),
      fontSize: supportUI.resFontSize(14),
      fontWeight: FontWeight.w400);
  late final TextStyle _inputTextStyle = TextStyle(
      color: jakomoColor.black,
      fontFamily: supportUI.fontNanum('r'),
      fontSize: supportUI.resFontSize(14),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: supportUI.resWidth(20)),
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
              width: supportUI.deviceWidth * 5 / 6 - supportUI.resWidth(32),
              child: Center(
                child: TextField(
                  cursorColor: jakomoColor.silver,
                  style: _inputTextStyle,
                  decoration: InputDecoration(
                      hintText: '제목을 입력해주세요.',
                      hintStyle: _hintTextStyle,
                      border: InputBorder.none,
                      isDense: true),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
