import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class MeasureNoData extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  MeasureNoData({Key? key, required this.supportUI, required this.jakomoColor}):super(key: key);
  late final TextStyle _noDataTextStyle = TextStyle(
    color: jakomoColor.boulder.withOpacity(0.3),
    fontFamily: supportUI.fontNanum('b'),
    fontSize: supportUI.resFontSize(21),
    fontWeight: FontWeight.bold
  );
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: supportUI.deviceWidth,
      height: supportUI.resHeight(146),
      child: Center(
        child: Text('측정 내역이 없습니다.', style: _noDataTextStyle, textAlign: TextAlign.center,),
      ),
    );
  }

}