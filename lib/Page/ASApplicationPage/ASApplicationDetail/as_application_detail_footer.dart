import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Routes/jakomo_routes.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class ASApplicationDetailFooter extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  ASApplicationDetailFooter({Key? key, required this.supportUI, required this.jakomoColor}):super(key: key);
  late final TextStyle _directTextStyle = TextStyle(
    color: jakomoColor.boulder,
    fontSize: supportUI.resFontSize(14),
    fontFamily: supportUI.fontNanum('r')
  );
  late final TextStyle _itemTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontSize: supportUI.resFontSize(13),
      fontFamily: supportUI.fontNanum('r')
  );
  late final double _directQuestion = supportUI.getTextSize('1:1문의', _itemTextStyle).width;
  late final double _callQuestion = supportUI.getTextSize('전화문의', _itemTextStyle).width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: supportUI.resWidth(30)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: supportUI.commonLeft(), top: supportUI.resWidth(26), bottom: supportUI.resWidth(20)),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Text('직접 문의를 원하시나요?', style: _directTextStyle,),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap:(){
                    Get.toNamed(JakomoRoutes.inquiry);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: supportUI.resWidth(1)),
                        child: Center(
                          child: SizedBox(
                            width: _directQuestion*2/3,
                            child: Image.asset('images/chat_icon.png', fit: BoxFit.fitWidth,),
                          ),
                        ),
                      ),
                      Center(
                        child: Text('1:1문의', style: _itemTextStyle,),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: supportUI.resWidth(65)),
                  child: Center(
                    child: Container(
                      width: supportUI.resWidth(1),
                      height: supportUI.resWidth(40),
                      color: jakomoColor.concrete.withOpacity(0.6),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    launch("tel://1588-6007");
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: supportUI.resWidth(1)),
                        child: Center(
                          child: SizedBox(
                            width: _callQuestion*2/3,
                            child: Image.asset('images/call_icon.png', fit: BoxFit.fitWidth,),
                          ),
                        ),
                      ),
                      Center(
                        child: Text('전화문의', style: _itemTextStyle,),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}