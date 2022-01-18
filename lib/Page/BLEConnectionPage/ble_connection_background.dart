import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class BLEConnectionBackGround extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  const BLEConnectionBackGround(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: supportUI.deviceWidth,
        height: supportUI.deviceHeight * 23 / 64,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/ble_background.png'), fit: BoxFit.fill),
        ),
        child: Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: Container(
            width: supportUI.deviceWidth,
            height: supportUI.resWidth(20),
            decoration: BoxDecoration(
                color: jakomoColor.alabaster,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20))),
          ),
        ));
  }
}
