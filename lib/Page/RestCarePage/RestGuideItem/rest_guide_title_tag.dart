import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class RestGuideTitleTag extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final String tag;
  RestGuideTitleTag({Key? key, required this.supportUI, required this.jakomoColor, required this.tag}):super(key: key);
  late final TextStyle _tagTextStyle = TextStyle(
    fontSize: supportUI.resFontSize(10),
    fontFamily: supportUI.fontNanum('b'),
    fontWeight: FontWeight.w400,
    color: jakomoColor.white
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.resWidth(53),
      height: supportUI.resWidth(28),
      decoration: BoxDecoration(
        color: jakomoColor.alabaster.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(14))
      ),
      child: Center(
        child: Text('#$tag', style: _tagTextStyle,),
      ),
    );
  }

}