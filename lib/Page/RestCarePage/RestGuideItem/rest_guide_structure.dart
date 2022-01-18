import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/HomePage/JakomoCustomCare/jakomo_custom_care_model.dart';
import 'package:jakomo_recliner/Page/RestCarePage/RestGuideItem/rest_guide_contents.dart';
import 'package:jakomo_recliner/Page/RestCarePage/RestGuideItem/rest_guide_top.dart';
import 'package:jakomo_recliner/Page/RestCarePage/RestGuideItem/rest_guide_useful.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import '../rest_care_navigation_controller.dart';

class RestGuideStructure extends StatefulWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final JakomoCustomCareModel jakomoCustomCareModel;

  const RestGuideStructure(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.jakomoCustomCareModel})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _RestGuideStructure();
}

class _RestGuideStructure extends State<RestGuideStructure> {
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  late final JakomoCustomCareModel jakomoCustomCareModel =
      widget.jakomoCustomCareModel;
  final RestCareNavigationController restCareNavigationController = Get.find();

  late final ScrollController scrollController;
  double scrollValue = 0;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() {
      setState(() {
        scrollValue = scrollController.offset;
      });
    });
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      if (supportUI.getWidgetSize(_topKey) != null) {
        restCareNavigationController.guideWidgetSize.value =
            supportUI.getWidgetSize(_topKey)!.height;
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  final GlobalKey _topKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SizedBox(
        width: supportUI.deviceWidth,
        height: supportUI.deviceHeight,
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: scrollController,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  RestGuideTop(
                      key: _topKey,
                      supportUI: supportUI,
                      jakomoColor: jakomoColor,
                      jakomoCustomCareModel: jakomoCustomCareModel),
                  Padding(
                    padding: EdgeInsets.only(top: supportUI.resHeight(290)),
                    child: _contents(),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional.topCenter,
              child: scrollValue >
                      restCareNavigationController.guideWidgetSize.value
                  ? _sticker()
                  : Container(),
            )
          ],
        ),
      );
    });
  }

  Widget _contents() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RestGuideContets(
            supportUI: supportUI,
            jakomoColor: jakomoColor,
            jakomoCustomCareModel: jakomoCustomCareModel),
        RestGuideUseful(supportUI: supportUI, jakomoColor: jakomoColor)
      ],
    );
  }

  late final TextStyle textStyle = TextStyle(
      color: jakomoColor.black,
      fontSize: supportUI.resFontSize(12),
      fontFamily: supportUI.fontNanum('r'),
      fontWeight: FontWeight.w800);

  Widget _sticker() {
    return Container(
      width: supportUI.deviceWidth,
      height: supportUI.resHeight(50),
      decoration: BoxDecoration(
          color: jakomoColor.white,
          border:
              Border(bottom: BorderSide(color: jakomoColor.silver, width: 1))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: supportUI.resWidth(5)),
            child: Center(
              child: GestureDetector(
                child: Image.asset(
                  'images/white_back_icon.png',
                  width: supportUI.resWidth(9),
                  height: supportUI.resHeight(15),
                  fit: BoxFit.fill,
                ),
                onTap: (){
                  print('hey');
                  Get.back();
                },
              ),
            ),
          ),
          Center(
            child: Text(
              jakomoCustomCareModel.title,
              style: textStyle,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: supportUI.resWidth(14),
          )
        ],
      ),
    );
  }
}
