import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/BottomNavigation/bottom_navigation_controller.dart';
import 'package:jakomo_recliner/Page/RestCarePage/rest_care_navigation_controller.dart';
import 'package:jakomo_recliner/Page/RestCarePage/rest_care_sliverheader.dart';
import 'package:jakomo_recliner/Page/RestCarePage/rest_care_title.dart';
import 'package:jakomo_recliner/Page/RestCarePage/rest_navigation.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'RestCareAuido/rest_care_audio.dart';
import 'RestCareGuide/rest_care_guide.dart';
import 'RestCareMode/rest_care_mode_structure.dart';

class RestCareScroll extends StatefulWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  const RestCareScroll(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _RestCareScroll();
}

class _RestCareScroll extends State<RestCareScroll> {
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;

  final RestCareNavigationController restCareNavigationController = Get.find();
  late final ScrollController scrollController;
  final double silverMinHeight = 0.0;
  final BottomNavigationController bottomNavigationController = Get.find();

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      restCareNavigationController.widgetSize.value =
          supportUI.getWidgetSize(_topKey) == null
              ? 270
              : supportUI.getWidgetSize(_topKey)!.height;
      if(scrollController.position.userScrollDirection == ScrollDirection.reverse){
        bottomNavigationController.scrollNow.value = false;
      }
      scrollController.position.isScrollingNotifier.addListener(() {
        if (!scrollController.position.isScrollingNotifier.value) {
          bottomNavigationController.scrollNow.value = true;
        }
      });
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
      return NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverPersistentHeader(
                    pinned: true,
                    delegate: RestCareSliverHeaderDelegates(
                        minHeight: 0,
                        maxHeight:
                            restCareNavigationController.widgetSize.value,
                        minChild: Container(),
                        maxChild: _topUI())),
              ),
            ];
          },
          body: _contents());
    });
  }

  Widget _topUI() {
    return Column(
      key: _topKey,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RestCareTitle(supportUI: supportUI, jakomoColor: jakomoColor),
        RestCareModeStructure(supportUI: supportUI, jakomoColor: jakomoColor),
      ],
    );
  }

  Widget _contents() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RestNavigation(supportUI: supportUI, jakomoColor: jakomoColor),
        Expanded(
            child: SingleChildScrollView(
          child: restCareNavigationController.nowPageIdx.value == 1
              ? RestCareGuide(supportUI: supportUI, jakomoColor: jakomoColor)
              : RestCareAudio(supportUI: supportUI, jakomoColor: jakomoColor),
        ))
      ],
    );
  }
}
