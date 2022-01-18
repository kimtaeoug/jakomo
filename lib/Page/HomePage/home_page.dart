import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/Page/BottomNavigation/navigation_with_floating.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/HomePage/home_background.dart';
import 'package:jakomo_recliner/Page/HomePage/home_context_menu.dart';
import 'package:jakomo_recliner/Page/HomePage/home_page_structure.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class HomePage extends StatelessWidget{
  final SupportUI supportUI = SupportUI();
  final JakomoColor jakomoColor = JakomoColor();
  HomePage({Key? key}):super(key: key);
  late final CommonUI commonUI = CommonUI(supportUI: supportUI, jakomoColor: jakomoColor);
  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage('images/home_background.png'), context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: jakomoColor.black,
        body: WillPopScope(
          onWillPop: ()=>Future(()=>false),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Align(
                alignment: AlignmentDirectional.topCenter,
                child: HomeBackground(supportUI: supportUI, jakomoColor: jakomoColor),
              ),
              HomePageStructure(supportUI: supportUI, jakomoColor: jakomoColor),
              HomeContextMenu(supportUI: supportUI, jakomoColor: jakomoColor),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: NavigationWithFloating(supportUI: supportUI, jakomoColor: jakomoColor),
              ),
              Align(
                alignment: AlignmentDirectional.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: supportUI.resHeight(32)),
                  child: commonUI.recommendPopUp(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}