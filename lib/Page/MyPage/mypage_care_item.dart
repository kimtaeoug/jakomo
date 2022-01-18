import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class MyPageCareItem extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final String title;
  final double value;
  MyPageCareItem({
    Key? key,
    required this.supportUI,
    required this.jakomoColor,
    required this.title,
    required this.value
  }) : super(key: key);
  late final TextStyle _titleTextStyle = TextStyle(
    color: jakomoColor.boulder,
    fontWeight: FontWeight.w400,
    fontSize: supportUI.resFontSize(12),
    fontFamily: supportUI.fontNanum('b')
  );
  late final TextStyle _valueTextStyle = TextStyle(
    color: jakomoColor.black,
    fontSize: supportUI.resFontSize(21),
    fontFamily: supportUI.fontPoppings('semibold'),
    fontWeight: FontWeight.bold
  );
  late final TextStyle _itemTextStyle = TextStyle(
    color: jakomoColor.boulder,
    fontWeight: FontWeight.w200,
    fontSize: supportUI.resFontSize(14),
    fontFamily: supportUI.fontNanum('r')
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.resWidth(96),
      height: supportUI.resWidth(96),
      decoration: BoxDecoration(
        color: jakomoColor.white,
        borderRadius: const BorderRadius.all(Radius.circular(8))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: supportUI.resWidth(14)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: supportUI.resWidth(11), right: supportUI.resWidth(4)),
                  child: SizedBox(
                    width: supportUI.resWidth(14),
                    height: supportUI.resWidth(14),
                    child: Image.asset('images/${title}_icon.png'),
                  ),
                ),
                Text(_convertTitle(title), style: _titleTextStyle,)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: supportUI.resWidth(18)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: supportUI.resWidth(5)),
                  child: Text(value.toString(), style: _valueTextStyle,),
                ),
                Padding(
                  padding: EdgeInsets.only(right: supportUI.resWidth(10)),
                  child: SizedBox(
                    height: supportUI.getTextSize(value.toString(), _valueTextStyle).height,
                    child: Align(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: Text(_convertItem(title), style: _itemTextStyle,),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  //time
  //heartbeat
  //calendar
  String _convertTitle(String title){
    String result = '휴식시간';
    switch(title){
      case 'heartbeat':
        result = '측정횟수';
        break;
      case 'calendar':
        result = '방문일';
        break;
    }
    return result;
  }
  String _convertItem(String title){
    String result = '시간';
    if(title != 'time'){
      result = '일';
    }
    return result;
  }
}