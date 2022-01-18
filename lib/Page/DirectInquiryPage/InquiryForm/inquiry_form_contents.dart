import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class InquiryFormContents extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  InquiryFormContents(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);

  late final TextStyle _hintTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontFamily: supportUI.fontNanum('r'),
      fontSize: supportUI.resFontSize(14)
  );
  late final TextStyle _textTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontFamily: supportUI.fontNanum('r'),
      fontSize: supportUI.resFontSize(14)
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: supportUI.resWidth(20)),
      child: Container(
        width: supportUI.deviceWidth*5/6,
        height: supportUI.resWidth(156),
        decoration: BoxDecoration(
            color: jakomoColor.white,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: Border.all(color: jakomoColor.gallery, width: 2)
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: supportUI.resWidth(16), vertical: supportUI.resWidth(10)),
            child: TextField(
              cursorColor: jakomoColor.silver,
              style: _textTextStyle,
              keyboardType: TextInputType.multiline,
              maxLines: 10,
              decoration: InputDecoration(
                hintText: '내용을 입력해주세요.',
                hintStyle: _hintTextStyle,
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
