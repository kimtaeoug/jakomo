import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Routes/jakomo_routes.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class MyPageRouteItem extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final int idx;

  MyPageRouteItem(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.idx})
      : super(key: key);

  late final TextStyle _titleTextStyle = TextStyle(
      color: jakomoColor.black,
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontNanum('b'),
      fontWeight: FontWeight.w800);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails detail){
        Get.toNamed(_wichRoute(idx));
      },
      child: Padding(
        padding: EdgeInsets.only(
            left: supportUI.resWidth(22),
            bottom: supportUI.resWidth(10),
            right: supportUI.resWidth(36)),
        child: SizedBox(
          height: supportUI.resWidth(46),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _convertTitle(idx),
                style: _titleTextStyle,
              ),
              SizedBox(
                height: supportUI
                    .getTextSize(_convertTitle(idx), _titleTextStyle)
                    .height,
                child: Center(
                  child: SizedBox(
                    width: supportUI.resWidth(24),
                    height: supportUI.resWidth(24),
                    child: Image.asset(
                      'images/more_icon.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String _convertTitle(int idx) {
    String result = '나의 측정기록 보기';
    switch (idx) {
      case 2:
        result = '내 계정관리';
        break;
      case 3:
        result = '제품 연결 관리';
        break;
      case 4:
        result = 'AS 신청';
        break;
      case 5:
        result = '자주 묻는 질문';
        break;
      case 6:
        result = '공지사항';
        break;
      case 7:
        result = '1:1 문의';
        break;
    }
    return result;
  }

  String _wichRoute(int idx) {
    String result = JakomoRoutes.careHistory;
    switch (idx) {
      case 2:
        result = JakomoRoutes.modify;
        break;
      case 3:
        result = JakomoRoutes.mypageBLE;
        break;
      case 4:
        result = JakomoRoutes.as;
        break;
      case 5:
        result = JakomoRoutes.askedQuestion;
        break;
      case 6:
        result = JakomoRoutes.notification;
        break;
      case 7:
        result = JakomoRoutes.inquiry;
        break;
    }
    return result;
  }
}
