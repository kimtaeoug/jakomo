import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class MeasureResultTitle extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  MeasureResultTitle({Key? key, required this.supportUI, required this.jakomoColor}):super(key: key);
  late final TextStyle _titleTextStyle = TextStyle(
    color: jakomoColor.black,
    fontSize: supportUI.resFontSize(24),
    fontWeight: FontWeight.bold,
    fontFamily: supportUI.fontNanum('eb')
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: supportUI.deviceWidth * 5 / 6,
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: SizedBox(
              width: supportUI.resWidth(95),
              height: supportUI.resHeight(32),
              child: Image.asset('images/logo_icon.png', fit: BoxFit.fitHeight,),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: supportUI.resHeight(18), bottom: supportUI.resHeight(5)),
          child: SizedBox(
            width: supportUI.deviceWidth * 5 / 6,
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                '측정이', style: _titleTextStyle, textAlign: TextAlign.start,
              ),
            ),
          ),
        ),
        SizedBox(
          width: supportUI.deviceWidth * 5 / 6,
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              '완료되었습니다.', style: _titleTextStyle, textAlign: TextAlign.start,
            ),
          ),
        )
      ],
    );
  }
  
}