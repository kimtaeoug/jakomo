import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class BLEConnectionCloseButton extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  const BLEConnectionCloseButton({Key? key, required this.supportUI, required this.jakomoColor}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Container(
        width: supportUI.resWidth(52),
        height: supportUI.resWidth(52),
        decoration: BoxDecoration(
            color: jakomoColor.mineShaft,
            shape: BoxShape.circle
        ),
        child: Center(
          child: SizedBox(
            width: supportUI.resWidth(20),
            height: supportUI.resWidth(20),
            child: Image.asset('images/white_close_icon.png', fit: BoxFit.fill,),
          ),
        ),
      ),
    );
  }

}