import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class InquiryHistoryNone extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  InquiryHistoryNone(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);
  late final TextStyle _noneTextStyle = TextStyle(
      color: jakomoColor.boulder.withOpacity(0.3),
      fontSize: supportUI.resFontSize(13),
      fontWeight: FontWeight.bold,
      fontFamily: supportUI.fontNanum('b'));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: supportUI.resHeight(72), bottom: supportUI.resHeight(214)),
      child: Text(
        '내역이 없습니다.',
        style: _noneTextStyle,
      ),
    );
  }
}