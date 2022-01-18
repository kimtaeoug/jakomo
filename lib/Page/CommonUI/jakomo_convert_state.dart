import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class JakomoConvertState extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final int idx;
  JakomoConvertState({Key? key, required this.supportUI, required this.jakomoColor, required this.idx}):super(key: key);
  late final TextStyle _stateTextStyle1 = TextStyle(
      color: jakomoColor.pistachio,
      fontWeight: FontWeight.w400,
      fontSize: supportUI.resFontSize(10),
      fontFamily: supportUI.fontNanum('b'));
  late final TextStyle _stateTextStyle2 = TextStyle(
      color: jakomoColor.red,
      fontWeight: FontWeight.w400,
      fontSize: supportUI.resFontSize(10),
      fontFamily: supportUI.fontNanum('b'));
  late final TextStyle _stateTextStyle3 = TextStyle(
      color: jakomoColor.boulder,
      fontWeight: FontWeight.w400,
      fontSize: supportUI.resFontSize(10),
      fontFamily: supportUI.fontNanum('b'));

  @override
  Widget build(BuildContext context) {
    return _convertState(idx);
  }
  Widget _convertState(int idx) {
    Widget result = Container(
      width: supportUI.resWidth(52),
      height: supportUI.resWidth(20),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: jakomoColor.pistachio),
          color: jakomoColor.transperent),
      child: Center(
        child: Text(
          'AS진행',
          style: _stateTextStyle1,
        ),
      ),
    );

    switch (idx) {
      case 2:
        result = Container(
          width: supportUI.resWidth(62),
          height: supportUI.resWidth(20),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: jakomoColor.red),
              color: jakomoColor.transperent),
          child: Center(
            child: Text(
              'AS진행불가',
              style: _stateTextStyle2,
            ),
          ),
        );
        break;
      case 3:
        result = Container(
          width: supportUI.resWidth(62),
          height: supportUI.resWidth(20),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              color: jakomoColor.white),
          child: Center(
            child: Text(
              'AS신청대기',
              style: _stateTextStyle3,
            ),
          ),
        );
        break;
      case 4:
        result = Container(
          width: supportUI.resWidth(62),
          height: supportUI.resWidth(20),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: jakomoColor.pistachio),
              color: jakomoColor.transperent),
          child: Center(
            child: Text(
              'AS진행완료',
              style: _stateTextStyle1,
            ),
          ),
        );
        break;
    }
    return result;
  }

}