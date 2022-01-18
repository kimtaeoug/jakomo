import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class MeasureLogo extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  const MeasureLogo({Key? key, required this.supportUI, required this.jakomoColor}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: supportUI.resWidth(72),
      height: supportUI.resHeight(24),
      child: Image.asset('images/logo_icon.png', fit: BoxFit.fitWidth,),
    );
  }

}