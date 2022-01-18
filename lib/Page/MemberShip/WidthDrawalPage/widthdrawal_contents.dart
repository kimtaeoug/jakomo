import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class WidthdrawalContents extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  WidthdrawalContents(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);
  final ScrollController _scrollController = ScrollController();
  final String _dummyText = '고객님께서 회원 탈퇴를 원하신다니 저희쇼핑몰의 서비스가 많이 부족하고 미흡했나봅니다. 불편하셨던 점이나 불만사항을알려주시면 적극 반영해서 고객님의 불편함을해결해 드리도록 노력하겠습니다.\n\n\n\n';
  late final TextStyle _textStyle = TextStyle(
      color: jakomoColor.black,
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontNanum('r'));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: supportUI.resWidth(24), bottom: supportUI.resWidth(28)),
      child: Center(
        child: Container(
          width: supportUI.deviceWidth * 5 / 6,
          height: supportUI.resWidth(137),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              color: jakomoColor.whisper),
          child: Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: SizedBox(
              width: supportUI.deviceWidth * 7 / 9,
              height: supportUI.resWidth(120),
              child: RawScrollbar(
                  controller: _scrollController,
                  isAlwaysShown: true,
                  thumbColor: jakomoColor.boulder,
                  thickness: supportUI.resWidth(4),
                  radius: const Radius.circular(2),
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Text(
                      _dummyText,
                      softWrap: true,
                      style: _textStyle,
                    ),
                  )
              ),
            ),
          ),
        ),
      ),
    );
  }
}
