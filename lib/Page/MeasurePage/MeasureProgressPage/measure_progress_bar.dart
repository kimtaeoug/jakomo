import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureProgressPage/measure_progress_controller.dart';
import 'package:jakomo_recliner/Routes/jakomo_routes.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import 'measure_jumping_dot.dart';

class MeasureProgressBar extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  MeasureProgressBar(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);
  late final TextStyle _measureTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontNanum('eb'),
      fontWeight: FontWeight.bold);

  late final TextStyle _valueTextStyle = TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: supportUI.fontPoppings('regular'),
      fontSize: supportUI.resFontSize(40),
      color: jakomoColor.black);
  late final TextStyle _valueTextStyle2 = TextStyle(
      fontSize: supportUI.resFontSize(40),
      fontFamily: supportUI.fontPoppings('regular'),
      color: jakomoColor.pistachio,
      fontWeight: FontWeight.w400);
  final MeasureProgressController measureProgressController = Get.find();
  late final CircularSliderAppearance circularSliderAppearance = CircularSliderAppearance(
      startAngle: 270,
      angleRange: 360,
      customWidths: CustomSliderWidths(
          trackWidth: 1,
          handlerSize:
          measureProgressController.progressValue.value == 100
              ? 0
              : 4,
          progressBarWidth: 3),
      customColors: CustomSliderColors(
          dotColor: jakomoColor.pistachio,
          trackColor: jakomoColor.gallery,
          progressBarColor: jakomoColor.pistachio));
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: supportUI.resWidth(250),
      height: supportUI.resHeight(250),
      child: Obx(() {
        return SleekCircularSlider(
            min: 0,
            max: 100,
            initialValue: measureProgressController.progressValue.value,
            appearance: circularSliderAppearance,
            innerWidget: (double vale) {
              return Center(
                child: Container(
                  width: supportUI.resWidth(200),
                  height: supportUI.resHeight(200),
                  decoration: BoxDecoration(
                      color: jakomoColor.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: jakomoColor.grey.withOpacity(0.1),
                            spreadRadius: 10,
                            blurRadius: 10)
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          measureProgressController.progressValue.value == 100
                              ? '측정이 완료되었습니다'
                              : '측정중',
                          style: _measureTextStyle,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(JakomoRoutes.careResult),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: supportUI.resHeight(5)),
                            child: Text(
                              '${measureProgressController.progressValue.value.toInt()}%',
                              style: measureProgressController
                                          .progressValue.value ==
                                      100
                                  ? _valueTextStyle2
                                  : _valueTextStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      MeasureJumpingDot(
                          supportUI: supportUI,
                          jakomoColor: jakomoColor,
                          numberOfDots: 3)
                    ],
                  ),
                ),
              );
            });
      }),
    );
  }
}
