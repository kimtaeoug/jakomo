import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/Page/HomePage/Footer/footer.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class MyPageFooter extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  const MyPageFooter({
    Key? key,
    required this.supportUI,
    required this.jakomoColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.deviceWidth,
      color: jakomoColor.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: supportUI.resHeight(55)),
            child: Container(
              width: supportUI.deviceWidth,
              height: supportUI.resHeight(8),
              color: jakomoColor.alabaster,
            ),
          ),
          Footer(supportUI: supportUI, jakomoColor: jakomoColor)
        ],
      ),
    );
  }
}