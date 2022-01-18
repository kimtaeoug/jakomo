import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/Page/BottomNavigation/bottom_navigation.dart';
import 'package:jakomo_recliner/Page/BottomNavigation/jakomo_floating_button.dart';
import 'package:jakomo_recliner/Page/BottomNavigation/jakomo_music_button.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class NavigationWithFloating extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  const NavigationWithFloating({Key? key, required this.supportUI, required this.jakomoColor}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: supportUI.resWidth(24)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(right: supportUI.commonLeft()-supportUI.resWidth(8), bottom: supportUI.resWidth(4)),
            child: Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: JakomoMusicButton(supportUI: supportUI, jakomoColor: jakomoColor),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: supportUI.commonLeft(), bottom: supportUI.resWidth(10)),
            child: Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: JakomoFloatingButton(supportUI: supportUI, jakomoColor: jakomoColor),
            ),
          ),
          Center(
            child: BottomNavigation(supportUI: supportUI, jakomoColor: jakomoColor),
          )
        ],
      ),
    );
  }

}