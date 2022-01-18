import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_loading_cupertino.dart';

import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class UITest extends StatelessWidget {
  final SupportUI supportUI = SupportUI();
  final JakomoColor jakomoColor = JakomoColor();

  UITest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: JakomoLoadingCupertino(
              animating: true,
              radius: 10,
              tickCount: 8,
              activeColor: jakomoColor.chambray,
              inactiveColor: jakomoColor.athensGray2,
              animationDuration: const Duration(seconds: 1),
              relativeWidth: 1,
              startRatio: 0.5,
              endRatio: 1.0)),
    );
  }
}
