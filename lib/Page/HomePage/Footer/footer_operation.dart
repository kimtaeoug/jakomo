import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class OperationFooter extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final TextStyle corpNumberTextStyle;
  final TextStyle operationTextStyle;
  const OperationFooter({Key? key, required this.supportUI, required this.jakomoColor, required this.corpNumberTextStyle, required this.operationTextStyle}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: supportUI.deviceWidth,
          child: Center(
            child: Text(
              '1588 - 6007',
              style: corpNumberTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: supportUI.resWidth(10), bottom: supportUI.resWidth(25)),
          child: SizedBox(
            width: supportUI.deviceWidth,
            child: Text(
              'AM 10:00 ~ PM 17:00 (점심시간 12:00 ~ 14:00)\nDAY OFF (토/일/공휴일)',
              style: operationTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Center(
          child: Container(
            width: supportUI.deviceWidth*5/6,
            height: supportUI.resHeight(1),
            color: jakomoColor.mineShaft.withOpacity(0.1),
          ),
        )
      ],
    );
  }

}