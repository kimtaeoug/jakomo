import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Routes/jakomo_routes.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class JakomoUsefulInfoAll extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  JakomoUsefulInfoAll(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);
  late final TextStyle _textStyle = TextStyle(
    color: jakomoColor.boulder,
    fontWeight: FontWeight.w400,
    fontFamily: supportUI.fontNanum('b'),
    fontSize: supportUI.resFontSize(13),
    decoration: TextDecoration.underline
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: supportUI.resWidth(8), right: supportUI.commonLeft()),
      child: SizedBox(
        height: supportUI.resHeight(212),
        child: Center(
          child: GestureDetector(
            onTap: (){
              Get.toNamed(JakomoRoutes.rest);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: supportUI.resWidth(48),
                  height: supportUI.resWidth(48),
                  decoration: BoxDecoration(
                    border: Border.all(color: jakomoColor.silver),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Center(
                    child: SizedBox(
                      width: supportUI.resWidth(16),
                      height: supportUI.resWidth(16),
                      child: Image.asset('images/right_arrow_icon.png', fit: BoxFit.fill,),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: supportUI.resWidth(8)),
                  child: Text('전체보기', style: _textStyle,),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
