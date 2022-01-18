import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class JakomoCustomCareTag extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final String tag;

  JakomoCustomCareTag(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.tag})
      : super(key: key);
  late final TextStyle _tagTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: supportUI.fontNanum('b'),
      color: jakomoColor.emperor, fontSize: supportUI.resFontSize(10));

  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.resWidth(53),
      height: supportUI.resWidth(28),
      decoration: BoxDecoration(
          color: jakomoColor.alabaster,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Center(
        child: Text(
          '#$tag',
          style: _tagTextStyle,
        ),
      ),
    );
  }
}
