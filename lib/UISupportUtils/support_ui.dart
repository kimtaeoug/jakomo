import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupportUI{
  static final SupportUI supportUI = SupportUI._init();
  SupportUI._init();
  factory SupportUI() => supportUI;

  double deviceWidth = 0.0;
  double deviceHeight = 0.0;
  final double designWidth = 360.0;
  final double designHeight = 640.0;
  late ScreenUtil screenUtil;
  void initScreenUtil(){
    ScreenUtil.init(
      BoxConstraints(maxWidth: deviceWidth, maxHeight: deviceHeight),
      designSize: Size(designWidth, designHeight),
      orientation: Orientation.portrait
    );
    screenUtil = ScreenUtil();
    print('new');
  }
  double resWidth(double width) => screenUtil.setWidth(width);
  double resHeight(double height) => screenUtil.setWidth(height);
  double resFontSize(double sp) => screenUtil.setSp(sp);
  double forWeight(double height) => screenUtil.setHeight(height);
  double realFontSize(double sp) => screenUtil.setSp(sp.sp);
  double commonLeft() => deviceWidth/12;

  String fontNanum(String input) => input;
  String fontPoppings(String input) => input;

  Size getTextSize(String inputText, TextStyle inputTextStyle){
    final TextPainter _textPainter = TextPainter(
      text: TextSpan(text: inputText, style: inputTextStyle),
      textScaleFactor: 1.0,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.start
    )..layout();
    return _textPainter.size;
  }
  Size getTextSize2(String inputText, TextStyle inputTextStyle){
    final TextPainter _textPainter = TextPainter(
        text: TextSpan(text: inputText, style: inputTextStyle),
        textScaleFactor: 1.1,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.start
    )..layout();
    return _textPainter.size;
  }
  String twoDigits(int n) => n >= 10 ? '$n' : '0$n';

  Size? getWidgetSize(GlobalKey key){
    if(key.currentContext != null){
      final RenderBox renderBox = key.currentContext!.findRenderObject() as RenderBox;
      return renderBox.size;
    }else{
      return null;
    }
  }
}