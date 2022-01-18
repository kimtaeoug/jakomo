import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class JakomoOperationTime extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  JakomoOperationTime({Key? key, required this.supportUI, required this.jakomoColor}):super(key: key);
  late final TextStyle _numberTextStyle = TextStyle(
      color: jakomoColor.black,
      fontFamily: supportUI.fontPoppings('bold'),
      fontSize: supportUI.resFontSize(28),
      fontWeight: FontWeight.w700
  );
  late final TextStyle _contentsTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontNanum('r')
  );
  late final TextStyle _contentsNumberTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontPoppings('regular')
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Center(
          child: Text('1588 - 6007', style: _numberTextStyle,),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: supportUI.resWidth(8),
          ),
          child: Center(
            child: Text.rich(
              TextSpan(
                  children: [
                    TextSpan(text: 'AM 09:00 ~ PM 17:30 (', style: _contentsNumberTextStyle),
                    TextSpan(text: '점심시간', style: _contentsTextStyle),
                    TextSpan(text: '12:00 ~ 13:00)\n', style: _contentsNumberTextStyle),
                    TextSpan(text: 'DAY OFF ', style: _contentsNumberTextStyle),
                    TextSpan(text: '(토/일/공휴일)', style: _contentsTextStyle)
                  ]
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}