import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class WidthDrawalComments extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  WidthDrawalComments(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);
  late final TextStyle _titleTextStyle = TextStyle(
      color: jakomoColor.pistachio,
      fontSize: supportUI.resFontSize(16),
      fontFamily: supportUI.fontNanum('eb'),
      fontWeight: FontWeight.bold);
  late final TextStyle _hintTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontFamily: supportUI.fontNanum('r'),
      fontSize: supportUI.resFontSize(14));
  late final TextStyle _textStyle = TextStyle(
      color: jakomoColor.black,
      fontFamily: supportUI.fontNanum('r'),
      fontSize: supportUI.resFontSize(14));

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: supportUI.commonLeft(), bottom: supportUI.resWidth(19)),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                '말씀을 남겨주세요.',
                style: _titleTextStyle,
              ),
            ),
          ),
          Container(
            width: supportUI.deviceWidth * 5 / 6,
            height: supportUI.resWidth(168),
            decoration: BoxDecoration(
                color: jakomoColor.white,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                border: Border.all(color: jakomoColor.gallery2)),
            child: Align(
              alignment: AlignmentDirectional.center,
              child: SizedBox(
                width: supportUI.deviceWidth * 5 / 6 - supportUI.resWidth(40),
                height: supportUI.resWidth(148),
                child: TextField(
                  keyboardType: TextInputType.text,
                  maxLines: 5,
                  cursorColor: jakomoColor.silver,
                  style: _textStyle,
                  decoration: InputDecoration(
                    hintText: '내용을 입력해주세요. (최소 10자 이상)',
                    hintStyle: _hintTextStyle,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
