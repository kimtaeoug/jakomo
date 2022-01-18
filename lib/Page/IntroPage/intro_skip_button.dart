import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Routes/jakomo_routes.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'intro_controller.dart';

class IntroSkipButton extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  IntroSkipButton({Key? key, required this.supportUI, required this.jakomoColor}):super(key: key);
  late final TextStyle _skipTextStyle = TextStyle(
    fontFamily: supportUI.fontNanum('b'),
    fontSize: supportUI.resFontSize(12),
    color: jakomoColor.boulder,
    fontWeight: FontWeight.bold
  );
  final IntroController introController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: supportUI.resHeight(20), right: supportUI.resWidth(20)),
      child: GestureDetector(
        onTap: (){
          Get.toNamed(JakomoRoutes.home);
        },
        child: Container(
          width: supportUI.resWidth(68),
          height: supportUI.resHeight(28),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(14)),
              color: jakomoColor.blackHaze
          ),
          child: Center(
            child: Text('건너뛰기', style: _skipTextStyle,),
          ),
        ),
      ),
    );
  }

}