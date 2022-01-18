import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/IntroPage/intro_controller.dart';
import 'package:jakomo_recliner/Routes/jakomo_routes.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroBottom extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final int listLength;
  IntroBottom({Key? key, required this.supportUI, required this.jakomoColor, required this.listLength}):super(key: key);
  final IntroController introController = Get.find();
  late final PageController imgController = introController.imgPageController;
  // late final PageController textController = introController.textPageController;
  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage('images/splash_end_icon.png'), context);
    precacheImage(const AssetImage('images/next_icon.png'), context);
    precacheImage(const AssetImage('images/back_icon.png'), context);
    return Padding(
      padding: EdgeInsets.only(bottom: supportUI.resHeight(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              if(introController.pageIdx.value > 0){
                introController.moveTo(introController.pageIdx.value-1);
                introController.pageIdx.value = introController.pageIdx.value-1;
              }
              print('value : ${introController.pageIdx.value}');

            },
            child: Padding(
              padding: EdgeInsets.only(left: supportUI.resWidth(20)),
              child: Container(
                width: supportUI.resWidth(52),
                height: supportUI.resWidth(52),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: jakomoColor.seaShell),
                child: Center(
                  child: Image.asset(
                    'images/back_icon.png',
                    width: supportUI.resWidth(7.5),
                    height: supportUI.resHeight(14),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: supportUI.resHeight(52),
            child: Center(
                child : SmoothPageIndicator(
                  controller: imgController,
                  count: listLength,
                  effect: ExpandingDotsEffect(
                      expansionFactor: 4,
                      dotWidth: supportUI.resWidth(4),
                      dotHeight: supportUI.resHeight(4),
                      dotColor: jakomoColor.silver,
                      activeDotColor: jakomoColor.pistachio,
                      paintStyle: PaintingStyle.fill
                  ),
                )
            ),
          ),
          GestureDetector(
            onTap: () {
              if(introController.pageIdx.value < 2){
                introController.moveTo(introController.pageIdx.value+1);
                //pageIdx.value = idx;
                introController.pageIdx.value = introController.pageIdx.value+1;
              }else{
                Get.toNamed(JakomoRoutes.home);
              }
              print('value : ${introController.pageIdx.value}');

            },
            child: Padding(
              padding: EdgeInsets.only(right: supportUI.resWidth(20)),
              child: Container(
                width: supportUI.resWidth(52),
                height: supportUI.resWidth(52),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: jakomoColor.pistachio),
                child: Center(
                  child:  Obx(()=>Image.asset(
                    introController.pageIdx.value == 2?'images/splash_end_icon.png':'images/next_icon.png',
                    height: supportUI.resHeight(14),
                    fit: BoxFit.fitHeight,
                  )),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}