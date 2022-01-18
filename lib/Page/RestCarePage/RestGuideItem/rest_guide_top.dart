import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/HomePage/JakomoCustomCare/jakomo_custom_care_model.dart';
import 'package:jakomo_recliner/Page/RestCarePage/RestGuideItem/rest_guide_title.dart';
import 'package:jakomo_recliner/Page/RestCarePage/RestGuideItem/rest_guide_title_tag.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class RestGuideTop extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final JakomoCustomCareModel jakomoCustomCareModel;

  const RestGuideTop(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.jakomoCustomCareModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.8,
      child: Container(
        width: supportUI.deviceWidth,
        height: supportUI.resWidth(300),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(jakomoCustomCareModel.img),
                colorFilter: ColorFilter.mode(
                    jakomoColor.black.withOpacity(0.4), BlendMode.darken),
                fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: supportUI.resHeight(20), left: supportUI.resWidth(10)),
              child: GestureDetector(
                onTapDown: (TapDownDetails detail){
                  Get.back();
                },
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: SizedBox(
                    width: supportUI.resWidth(30),
                    height: supportUI.resHeight(30),
                    child: Align(
                      alignment: AlignmentDirectional.center,
                      child: Image.asset(
                        'images/white_back_icon.png',
                        width: supportUI.resWidth(9),
                        height: supportUI.resHeight(15),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            RestGuideTitle(
                supportUI: supportUI,
                jakomoColor: jakomoColor,
                jakomoCustomCareModel: jakomoCustomCareModel)
          ],
        ),
      ),
    );
  }
}
