import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';
class SettingAlarmItem extends StatefulWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final int idx;
  SettingAlarmItem({Key? key, required this.supportUI, required this.jakomoColor, required this.idx}):super(key: key);

  late final TextStyle _textStyle = TextStyle(
      color: jakomoColor.black,
      fontSize: supportUI.resFontSize(14),
      fontWeight: FontWeight.w800,
      fontFamily: supportUI.fontNanum('b')
  );

  @override
  State<StatefulWidget> createState()=> _SettingAlarmItem();
}
class _SettingAlarmItem extends State<SettingAlarmItem>{
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  late final int idx = widget.idx;
  late final TextStyle _textStyle = widget._textStyle;
  bool clicked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>setState(() {
        clicked = !clicked;
      }),
      child: SizedBox(
        width: supportUI.deviceWidth * 7/ 9,
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
                      child: Text(_wichTitle(idx), style: _textStyle,),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: supportUI.resWidth(12)),
                child: _settingAlarmItemSwitch(),
              )
            ],
          ),
        ),
      ),
    );
  }
  String _wichTitle(int idx){
    String result = '자동로그인';
    switch(idx){
      case 2:
        result = '혜택 및 이벤트 소식';
        break;
      case 3:
        result = '1:1 문의 알림';
        break;
    }
    return result;
  }
  String _wichImage(int idx){
    String result = 'auto_login_icon';
    switch(idx){
      case 2:
        result = 'benefit_icon';
        break;
      case 3:
        result = 'inquiry_notification_icon';
        break;
    }
    return result;
  }
  Widget _settingAlarmItemSwitch(){
    return Container(
      width: supportUI.resWidth(40),
      height: supportUI.resWidth(24),
      decoration: BoxDecoration(
        color: clicked ? jakomoColor.pistachio : jakomoColor.silver,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Center(
        child: SizedBox(
          width: supportUI.resWidth(32),
          height: supportUI.resWidth(16),
          child: AnimatedAlign(
            duration: const Duration(milliseconds: 300),
            alignment: clicked
                ? AlignmentDirectional.centerEnd
                : AlignmentDirectional.centerStart,
            child: Container(
              width: supportUI.resWidth(16),
              height: supportUI.resWidth(16),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: jakomoColor.white,
                  boxShadow: [
                    BoxShadow(
                      color: jakomoColor.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 10,
                      // offset: const Offset(4.0, 2.0)
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}