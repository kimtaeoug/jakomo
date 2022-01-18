import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/RestCarePage/RestCareAuido/rest_care_audio_factory.dart';
import 'package:jakomo_recliner/Page/RestCarePage/rest_care_navigation_controller.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class RestNavigation extends StatefulWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  RestNavigation({Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _RestNavigation();
}

class _RestNavigation extends State<RestNavigation> {
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;

  late final TextStyle _activateTitleTextStyle = TextStyle(
      color: jakomoColor.black,
      fontSize: supportUI.resFontSize(18),
      fontWeight: FontWeight.w600);
  late final TextStyle _inActivateTitleTextStyle = TextStyle(
      color: jakomoColor.mineShaft.withOpacity(0.5),
      fontSize: supportUI.resFontSize(18),
      fontWeight: FontWeight.w600);
  final RestCareNavigationController restCareNavigationController = Get.find();
  final RestCareAudioFactory restCareAudioFactory = RestCareAudioFactory();

  late final double _lineWidth =
      supportUI.getTextSize('휴식 가이드', _activateTitleTextStyle).width;
  late final double _lineWidth2 =
      supportUI.getTextSize2('휴식 가이드', _activateTitleTextStyle).width;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      if (mounted) {
        Size? widgetSize = supportUI.getWidgetSize(widgetKey);
        if (widgetSize != null) {
          if (widgetSize.width > _lineWidth + supportUI.resWidth(4)) {
            setState(() {
              lineLess = true;
            });
          }
        }
      }
    });
  }

  bool lineLess = false;
  final GlobalKey widgetKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: EdgeInsets.only(top: supportUI.resWidth(30)),
        child: SizedBox(
          width: supportUI.deviceWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: supportUI.resWidth(30),
                        right: supportUI.resWidth(25)),
                    child: GestureDetector(
                      onTap: () {
                        restCareNavigationController.setNowPageIdx(1);
                      },
                      child: Text(
                        '휴식 가이드',
                        key: widgetKey,
                        style:
                            restCareNavigationController.nowPageIdx.value == 1
                                ? _activateTitleTextStyle
                                : _inActivateTitleTextStyle,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      restCareNavigationController.setNowPageIdx(2);
                      restCareAudioFactory.initObservingAudioPlayer();
                    },
                    child: Text(
                      '휴식 오디오',
                      style: restCareNavigationController.nowPageIdx.value == 2
                          ? _activateTitleTextStyle
                          : _inActivateTitleTextStyle,
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: supportUI.resWidth(30), top: supportUI.resHeight(6)),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: SizedBox(
                    width: lineLess
                        ? _lineWidth2 *
                                2 +
                            supportUI.resWidth(25)
                        : _lineWidth *
                                2 +
                            supportUI.resWidth(25),
                    height: supportUI.resHeight(1.5),
                    child: AnimatedAlign(
                      alignment:
                          restCareNavigationController.nowPageIdx.value == 1
                              ? AlignmentDirectional.centerStart
                              : AlignmentDirectional.centerEnd,
                      duration: const Duration(milliseconds: 500),
                      child: Container(
                        width: lineLess
                            ? _lineWidth2
                            : _lineWidth,
                        height: supportUI.resHeight(1.5),
                        color: jakomoColor.pistachio,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: supportUI.deviceWidth,
                height: supportUI.resHeight(1),
                color: jakomoColor.dustyGray.withOpacity(0.2),
              )
            ],
          ),
        ),
      );
    });
  }
}
