import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/Page/BLEConnectionPage/ble_connection_guide.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class BLEConnectionBottomSheet extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;
  BLEConnectionBottomSheet(
      {Key? key, required this.supportUI, required this.jakomoColor, required this.commonUI})
      : super(key: key);
  late final TextStyle _titleTextStyle = TextStyle(
      fontFamily: supportUI.fontNanum('eb'),
      color: jakomoColor.black,
      fontSize: supportUI.resFontSize(24),
      fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.deviceWidth,
      color: jakomoColor.alabaster,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: supportUI.resWidth(40),
                left: supportUI.resWidth(30),
                bottom: supportUI.resWidth(16)),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                '리클라이너 연결',
                style: _titleTextStyle,
              ),
            ),
          ),
          Center(
            child: commonUI.bleConnection(),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: supportUI.resWidth(18), left: supportUI.resWidth(30)),
            child: BLEConnectionGuide(
                supportUI: supportUI, jakomoColor: jakomoColor),
          )
        ],
      ),
    );
  }
}
