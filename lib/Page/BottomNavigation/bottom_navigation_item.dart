import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Routes/jakomo_routes.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'bottom_navigation_controller.dart';

class BottomNavigationItem extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final String whichItem;
  final bool isActivated;
  final TextStyle acitvateNavigationTextStyle;
  final TextStyle inactivateNavigationTextStyle;

  BottomNavigationItem(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.whichItem,
      required this.isActivated,
      required this.acitvateNavigationTextStyle,
      required this.inactivateNavigationTextStyle})
      : super(key: key);

  final BottomNavigationController bottomNavigationController = Get.find();

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('images/activate_${whichItem}_icon.png'), context);
    precacheImage(AssetImage('images/inactivate_${whichItem}_icon.png'), context);
    return GestureDetector(
      onTapDown: (TapDownDetails tapDownDetails){
        _getWhichFunction(whichItem);
      },
      child: SizedBox(
        width: supportUI.deviceWidth * 8 / 55,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: supportUI.resWidth(20),
                height: supportUI.resWidth(20),
                child: Obx((){
                  return Image.asset(
                    bottomNavigationController.currentRoute.value.contains(whichItem)
                        ? 'images/activate_${whichItem}_icon.png'
                        : 'images/inactivate_${whichItem}_icon.png',
                    fit: BoxFit.contain,
                  );
                }),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: supportUI.resWidth(5)),
              child: SizedBox(
                width: supportUI.resWidth(40),
                height: supportUI.resWidth(15),
                child: Center(
                  child: Obx((){
                    return Text(
                      _getWhichName(whichItem),
                      style: bottomNavigationController.currentRoute.value.contains(whichItem)
                          ? acitvateNavigationTextStyle
                          : inactivateNavigationTextStyle,
                      textAlign: TextAlign.center,
                    );
                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String _getWhichName(String input) {
    String result = '홈';
    switch (input) {
      case 'care':
        result = '건강케어';
        break;
      case 'rest':
        result = '휴식케어';
        break;
      case 'shopping':
        result = '쇼핑몰';
        break;
      case 'mypage':
        result = '마이';
        break;
    }
    return result;
  }
  Future<dynamic>? _getWhichFunction(String input){
    Future<dynamic>? result = Get.toNamed(JakomoRoutes.home);
    switch(input){
      case 'care':
        result = Get.toNamed(JakomoRoutes.care, arguments: false);
        break;
      case 'rest':
        result = Get.toNamed(JakomoRoutes.rest);
        break;
      case 'shopping':
        result =  Get.toNamed(JakomoRoutes.webview);
        break;
      case 'mypage':
        result = Get.toNamed(JakomoRoutes.login);
        break;
    }
    return result;
  }
}
