import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/HomePage/home_sound_icon.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'home_page_controller.dart';

class HomeContextMenu extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  HomeContextMenu(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);
  final HomePageController homePageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Opacity(
        opacity: homePageController.scrollOffset.value > 20 ? 0.7 : 1,
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(top: supportUI.resHeight(20)),
            child: SizedBox(
              width: supportUI.deviceWidth * 31 / 36,
              height: homePageController.scrollOffset.value >supportUI.resHeight(334)
                      // supportUI.deviceHeight * 25 / 32 -
                      //     supportUI.resHeight(120)
                  ? supportUI.resHeight(0)
                  : supportUI.resHeight(40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: supportUI.resWidth(72),
                    height: supportUI.resHeight(40),
                    child: Center(
                      child: Image.asset(
                        'images/logo_icon.png',
                        width: supportUI.resWidth(72),
                        height: supportUI.resHeight(24),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  HomeSoundIcon(supportUI: supportUI, jakomoColor: jakomoColor)
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
