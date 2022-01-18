import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Routes/jakomo_routes.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class MeasureRecentHistoryTitle extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  MeasureRecentHistoryTitle({Key? key, required this.supportUI, required this.jakomoColor}):super(key: key);

  late final TextStyle _titleTextStyle = TextStyle(
    color: jakomoColor.black,
    fontSize: supportUI.resFontSize(21),
    fontFamily: supportUI.fontNanum('eb'),
    fontWeight: FontWeight.w800
  );
  late final TextStyle _seeAllTextStyle = TextStyle(
    color: jakomoColor.boulder,
    fontSize: supportUI.resFontSize(13),
    fontFamily: supportUI.fontNanum('b'),
    decoration: TextDecoration.underline
  );
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: supportUI.deviceWidth*5/6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('최근 측정 기록', style: _titleTextStyle,),
          GestureDetector(
            onTap: (){
              Get.toNamed(JakomoRoutes.careHistory);
            },
            child: SizedBox(
              height: supportUI.getTextSize('최근', _titleTextStyle).height,
              child: Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Text('전체보기', style: _seeAllTextStyle,),
              ),
            ),
          )
        ],
      ),
    );
  }

}