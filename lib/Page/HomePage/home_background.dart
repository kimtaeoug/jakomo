import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/HomePage/home_page_controller.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class HomeBackground extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  HomeBackground({Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);
  final HomePageController homePageController = Get.find();

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage('images/home_background.png'), context);
    return Obx((){
      return Opacity(
        opacity: homePageController.scrollOffset.value > 20 ? 0.7 : 1,
        child: Container(
          width: supportUI.deviceWidth,
          height: supportUI.resWidth(454),
          // height: supportUI.deviceHeight * 25 / 32,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/home_background.png'),
                fit: BoxFit.fill),
          ),
        ),
      );
    });
  }
}
