import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_bottomsheet.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class SettingFooter extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  SettingFooter({Key? key, required this.supportUI, required this.jakomoColor}):super(key: key);

  late final JakomoBottomSheet jakomoBottomSheet = JakomoBottomSheet(supportUI: supportUI, jakomoColor: jakomoColor);
  late final CommonUI commonUI = CommonUI(supportUI: supportUI, jakomoColor: jakomoColor);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.deviceWidth,
      height: supportUI.resWidth(105),
      color: jakomoColor.concrete,
      child: Center(
        child: GestureDetector(
          onTap: (){
            jakomoBottomSheet.showLogOut(context);
          },
          child: commonUI.pistachioRectangleButton('로그아웃'),
        ),
      ),
    );
  }
}