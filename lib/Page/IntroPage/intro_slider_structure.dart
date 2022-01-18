import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/IntroPage/intro_controller.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'intro_circle_frame.dart';
import 'intro_model.dart';

class IntroSliderStructure extends StatefulWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final List<IntroModel> modelList;

  IntroSliderStructure(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.modelList})
      : super(key: key);
  late final TextStyle titleTextStyle = TextStyle(
      fontSize: supportUI.resFontSize(20),
      color: jakomoColor.black,
      fontWeight: FontWeight.bold,
      fontFamily: supportUI.fontNanum('eb'));
  late final TextStyle contentsTextStyle = TextStyle(
      fontSize: supportUI.resFontSize(16),
      color: jakomoColor.boulder,
      fontFamily: supportUI.fontNanum('r'));
  late final TextStyle idxTextStyle = TextStyle(
      color: jakomoColor.pistachio,
      fontSize: supportUI.resFontSize(16),
      fontFamily: supportUI.fontPoppings('bold'),
      fontWeight: FontWeight.w900);

  @override
  State<StatefulWidget> createState() => _IntroSliderStructure();
}

class _IntroSliderStructure extends State<IntroSliderStructure> {
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  late final List<IntroModel> modelList = widget.modelList;
  late final TextStyle titleTextStyle = widget.titleTextStyle;
  late final TextStyle contentsTextStyle = widget.contentsTextStyle;
  late final TextStyle idxTextStyle = widget.idxTextStyle;

  bool nowImgController = true;
  late final PageController imgController;
  final IntroController introController = Get.find();

  @override
  void initState() {
    imgController = PageController(viewportFraction: 1, keepPage: true);
    introController.setImagePageController(imgController);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    imgController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: AlignmentDirectional.center,
          child: SizedBox(
            width: supportUI.deviceWidth,
            height: supportUI.deviceWidth * 3 / 4 + supportUI.resHeight(150),
            child: PageView.builder(
                controller: imgController,
                scrollDirection: Axis.horizontal,
                itemCount: modelList.length,
                onPageChanged: (int idx){
                  introController.pageIdx.value = idx;
                },
                itemBuilder: (_, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: supportUI.deviceWidth,
                        height: supportUI.deviceWidth * 3 / 4,
                        child: Image.asset(
                          modelList[index].img,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: supportUI.resHeight(23)),
                        child: Center(
                          child: SizedBox(
                            width: supportUI.deviceWidth,
                            height: supportUI.resHeight(120),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom: supportUI.resHeight(7)),
                                  child: Text(
                                    modelList[index].title,
                                    style: titleTextStyle,
                                  ),
                                ),
                                Text(
                                  modelList[index].contents,
                                  style: contentsTextStyle,
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                }),
          ),
        ),
        Align(
          alignment: AlignmentDirectional.center,
          child: SizedBox(
            width: supportUI.deviceWidth,
            height: supportUI.deviceWidth * 3 / 4 + supportUI.resHeight(5),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  width: supportUI.deviceWidth,
                  child: ClipPath(
                    clipper: IntroCircleFrame(
                        supportUI: supportUI, jakomoColor: jakomoColor),
                    child: Container(
                      color: jakomoColor.white,
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: supportUI.deviceWidth * 3 / 4,
                    height: supportUI.deviceWidth * 3 / 4,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: supportUI.resWidth(10),
                          top: supportUI.resHeight(10)),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Obx(() {
                          return Text(
                            '0${introController.pageIdx.value + 1}.',
                            style: idxTextStyle,
                          );
                        }),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

