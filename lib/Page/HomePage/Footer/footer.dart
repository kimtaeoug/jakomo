import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_bottomsheet.dart';
import 'package:jakomo_recliner/Page/HomePage/Footer/footer_business_info.dart';
import 'package:jakomo_recliner/Page/HomePage/Footer/footer_operation.dart';
import 'package:jakomo_recliner/Routes/jakomo_routes.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class Footer extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  Footer({Key? key, required this.supportUI, required this.jakomoColor}):super(key: key);
  late final TextStyle _corpNumberTextStyle = TextStyle(
    fontSize: supportUI.resFontSize(28),
    fontFamily: supportUI.fontPoppings('semibold'),
    color: jakomoColor.mineShaft,
    fontWeight: FontWeight.w800
  );
  late final TextStyle _operationTextStyle = TextStyle(
    fontSize: supportUI.resFontSize(14),
    color: jakomoColor.mineShaft.withOpacity(0.6),
    fontFamily: supportUI.fontNanum('r'),
    fontWeight: FontWeight.w300,
    height: 1.5
  );
  late final TextStyle _etcTextStyle = TextStyle(
    color: jakomoColor.mineShaft,
    fontWeight: FontWeight.w600,
    fontFamily: supportUI.fontNanum('b'),
    fontSize: supportUI.resFontSize(12)
  );
  late final TextStyle _headTextStyle = TextStyle(
    color: jakomoColor.mineShaft.withOpacity(0.6),
    fontWeight: FontWeight.bold,
    fontFamily: supportUI.fontNanum('r'),
    fontSize: supportUI.resFontSize(10)
  );
  late final TextStyle _tailTextStyle = TextStyle(
    color: jakomoColor.mineShaft.withOpacity(0.6),
      fontFamily: supportUI.fontNanum('r'),
    fontSize: supportUI.resFontSize(10)
  );
  late final TextStyle _bottomTextStyle = TextStyle(
    color: jakomoColor.mineShaft.withOpacity(0.8),
    fontFamily: supportUI.fontNanum('b'),
    fontSize: supportUI.resFontSize(10),
    fontWeight: FontWeight.w500
  );
  late final JakomoBottomSheet jakomoBottomSheet = JakomoBottomSheet(supportUI: supportUI, jakomoColor: jakomoColor);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: jakomoColor.white,
        border: Border.all(color: jakomoColor.white)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          OperationFooter(supportUI: supportUI, jakomoColor: jakomoColor, corpNumberTextStyle: _corpNumberTextStyle, operationTextStyle: _operationTextStyle),
          Padding(
            padding: EdgeInsets.only(top: supportUI.resWidth(25), bottom: supportUI.resWidth(20), left: supportUI.resWidth(30)),
            child: GestureDetector(
              onTap: (){
                jakomoBottomSheet.showLogOut(context);
              },
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: Text('로그아웃', style: _etcTextStyle,),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: supportUI.resWidth(30), bottom: supportUI.resWidth(30)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: ()=>Get.toNamed(JakomoRoutes.inquiry),
                  child: Text('1:1문의', style: _etcTextStyle,),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: supportUI.resWidth(8)),
                  child: Container(
                    width: supportUI.resWidth(1),
                    height: supportUI.getTextSize('1:1문의', _etcTextStyle).height*2/3,
                    color: jakomoColor.mineShaft.withOpacity(0.5),
                  ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: Text('카카오톡 문의', style: _etcTextStyle,),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: supportUI.resWidth(30)),
            child: FooterBusinessInfo(supportUI: supportUI, jakomoColor: jakomoColor, etcTextStyle: _etcTextStyle, headTextStyle: _headTextStyle, tailTextStyle: _tailTextStyle),
          ),
          Padding(
            padding: EdgeInsets.only(top: supportUI.resWidth(25), bottom: supportUI.resWidth(150), left: supportUI.resWidth(30)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.toNamed(JakomoRoutes.term);
                  },
                  child: Text('서비스이용약관', style: _bottomTextStyle,),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: supportUI.resWidth(8)),
                  child: Container(
                    width: supportUI.resWidth(1),
                    height: supportUI.getTextSize('서비스', _bottomTextStyle).height*2/3,
                    color: jakomoColor.mineShaft.withOpacity(0.5),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.toNamed(JakomoRoutes.term);
                  },
                  child: Text('개인정보처리방침', style: _bottomTextStyle,),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
