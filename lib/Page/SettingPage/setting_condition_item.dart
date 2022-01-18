import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Routes/jakomo_routes.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class SettingConditionItem extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final int idx;

  SettingConditionItem(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.idx})
      : super(key: key);
  late final TextStyle _textStyle = TextStyle(
      color: jakomoColor.black,
      fontSize: supportUI.resFontSize(14),
      fontWeight: FontWeight.w800,
      fontFamily: supportUI.fontNanum('b'));

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(idx == 1){
          Get.toNamed(JakomoRoutes.term);
        }
      },
      child: SizedBox(
        width: supportUI.deviceWidth * 7 / 9,
        height: supportUI.resWidth(48),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: supportUI.resWidth(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: supportUI.resWidth(20),
                      height: supportUI.resWidth(20),
                      child: Image.asset('images/${_wichImage(idx)}.png'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: supportUI.resWidth(11)),
                      child: Text(
                        _wichTitle(idx),
                        style: _textStyle,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: supportUI.resWidth(12)),
                child: SizedBox(
                  width: supportUI.resWidth(18),
                  height: supportUI.resWidth(18),
                  child: Image.asset('images/left_icon.png'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String _wichTitle(int idx) {
    String result = '이용약관 및 정책';
    switch (idx) {
      case 2:
        result = '개인정보처리방침';
        break;
      case 3:
        result = '오픈소스 라이선스';
        break;
    }
    return result;
  }

  String _wichImage(int idx) {
    String result = 'tacap_icon';
    switch (idx) {
      case 2:
        result = 'info_policy_icon';
        break;
      case 3:
        result = 'license_icon';
        break;
    }
    return result;
  }
}
