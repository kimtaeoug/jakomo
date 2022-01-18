import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/Page/HomePage/JakomoEvent/jakomo_event.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class JakomoEventContainer extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  const JakomoEventContainer({Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: jakomoColor.white,
        border: Border.all(color: jakomoColor.white, width: 0)
      ),
      child: JakomoEvent(supportUI: supportUI, jakomoColor: jakomoColor),
    );
  }
}
