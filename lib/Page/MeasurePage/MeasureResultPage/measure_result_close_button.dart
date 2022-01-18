import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Routes/jakomo_routes.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class MeasureResultCloseButton extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  const MeasureResultCloseButton(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topEnd,
      child: Padding(
        padding: EdgeInsets.only(top: supportUI.resHeight(16), right: supportUI.resWidth(16)),
        child: GestureDetector(
          onTapDown: (TapDownDetails detail){
            Get.toNamed(JakomoRoutes.care, arguments: false);
          },
          child: SizedBox(
            width: supportUI.resWidth(24),
            height: supportUI.resHeight(24),
            child: Image.asset('images/black_close_icon.png', fit: BoxFit.fill,),
          ),
        ),
      ),
    );
  }

}