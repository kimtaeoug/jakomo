import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/Page/MemberShip/FindMemberShip/FindId/find_id_result_model.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class FindIdResultItem extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final FindIdResultModel findIdResultModel;

  FindIdResultItem(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.findIdResultModel})
      : super(key: key);
  late final TextStyle _textStyle = TextStyle(
      color: jakomoColor.pistachio,
      fontSize: supportUI.resFontSize(16),
      fontWeight: FontWeight.bold,
      fontFamily: supportUI.fontPoppings('semilbold'));
  late final TextStyle _dateStyle1 = TextStyle(
      color: jakomoColor.boulder,
      fontSize: supportUI.resFontSize(12),
      fontFamily: supportUI.fontPoppings('regular'));
  late final TextStyle _dateStyle2 = TextStyle(
      color: jakomoColor.boulder,
      fontSize: supportUI.resFontSize(12),
      fontFamily: supportUI.fontNanum('r'));

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: supportUI.resHeight(3)),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              findIdResultModel.id,
              style: _textStyle,
              textAlign: TextAlign.start,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: supportUI.resHeight(5)),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: Text.rich(TextSpan(children: [
              TextSpan(text: convertDate(findIdResultModel.date), style: _dateStyle1),
              TextSpan(text: ' 가입', style: _dateStyle2)
            ])),
          ),
        )
      ],
    );
  }
  String convertDate(DateTime input) {
    return '${input.year}.${twoDigits(input.month)}.${twoDigits(input.day)}';
  }
  String twoDigits(int n) => n >= 10 ? '$n' : '0$n';
}
