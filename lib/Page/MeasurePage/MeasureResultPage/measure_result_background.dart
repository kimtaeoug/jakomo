import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class MeasureResultBackGround extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  const MeasureResultBackGround({Key? key, required this.supportUI, required this.jakomoColor}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.deviceWidth,
      height: supportUI.resHeight(254),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
                'images/banner_short_img.png'
            ),
            fit: BoxFit.fill
        ),
      ),
    );
  }
}