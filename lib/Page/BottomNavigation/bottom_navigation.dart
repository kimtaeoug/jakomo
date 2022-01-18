import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:jakomo_recliner/Page/BottomNavigation/bottom_navigation_item.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class BottomNavigation extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  BottomNavigation(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);
  late final TextStyle acitvateNavigationTextStyle = TextStyle(
      fontSize: supportUI.resFontSize(8),
      fontWeight: FontWeight.bold,
      color: jakomoColor.pistachio);
  late final TextStyle inactivateNavigationTextStyle = TextStyle(
      fontSize: supportUI.resFontSize(8),
      fontWeight: FontWeight.bold,
      color: jakomoColor.silverChalice);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.deviceWidth * 8 / 9,
      height: supportUI.resWidth(64),
      decoration: BoxDecoration(
          color: jakomoColor.white,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: jakomoColor.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 10,
              // offset: const Offset(4.0, 2.0)
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottomNavigationItem(
              supportUI: supportUI,
              jakomoColor: jakomoColor,
              whichItem: 'home',
              isActivated: true,
              acitvateNavigationTextStyle: acitvateNavigationTextStyle,
              inactivateNavigationTextStyle: inactivateNavigationTextStyle),
          BottomNavigationItem(
              supportUI: supportUI,
              jakomoColor: jakomoColor,
              whichItem: 'care',
              isActivated: false,
              acitvateNavigationTextStyle: acitvateNavigationTextStyle,
              inactivateNavigationTextStyle: inactivateNavigationTextStyle),
          BottomNavigationItem(
              supportUI: supportUI,
              jakomoColor: jakomoColor,
              whichItem: 'rest',
              isActivated: false,
              acitvateNavigationTextStyle: acitvateNavigationTextStyle,
              inactivateNavigationTextStyle: inactivateNavigationTextStyle),
          BottomNavigationItem(
              supportUI: supportUI,
              jakomoColor: jakomoColor,
              whichItem: 'shopping',
              isActivated: false,
              acitvateNavigationTextStyle: acitvateNavigationTextStyle,
              inactivateNavigationTextStyle: inactivateNavigationTextStyle),
          BottomNavigationItem(
              supportUI: supportUI,
              jakomoColor: jakomoColor,
              whichItem: 'mypage',
              isActivated: false,
              acitvateNavigationTextStyle: acitvateNavigationTextStyle,
              inactivateNavigationTextStyle: inactivateNavigationTextStyle)
        ],
      ),
    );
  }
}
