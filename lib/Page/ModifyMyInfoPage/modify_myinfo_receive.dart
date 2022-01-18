import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class ModifyMyinfoReceive extends StatefulWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  const ModifyMyinfoReceive(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ModifyMyinfoReceive();
}

class _ModifyMyinfoReceive extends State<ModifyMyinfoReceive>{
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  late final TextStyle _titleTextStyle = TextStyle(
      color : jakomoColor.black,
      fontSize: supportUI.resFontSize(16),
      fontWeight: FontWeight.bold,
      fontFamily: supportUI.fontNanum('eb'));
  late final TextStyle _itemTextStyle = TextStyle(
      color : jakomoColor.boulder,
      fontWeight: FontWeight.w400,
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontNanum('b'));
  late final TextStyle _guideTextStyle = TextStyle(
      color : jakomoColor.boulder,
      fontSize: supportUI.resFontSize(14),
      fontWeight: FontWeight.w400,
      fontFamily: supportUI.fontNanum('r'));
  bool _checkEmail = false;
  bool _checkPhone = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: supportUI.commonLeft()),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Text('할인 쿠폰, 이벤트 소식 받기', style: _titleTextStyle,),
            ),
            Padding(
              padding: EdgeInsets.only(top: supportUI.resWidth(26), bottom: supportUI.resWidth(14)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: supportUI.resWidth(11)),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          _checkEmail = !_checkEmail;
                        });
                      },
                      child: SizedBox(
                        width: supportUI.resWidth(16),
                        height: supportUI.resWidth(16),
                        child: Image.asset(_checkEmail?'images/selected_checkbox.png':'images/unselected_checkbox.png'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: supportUI.resWidth(20)),
                    child: Text('이메일', style: _itemTextStyle,),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: supportUI.resWidth(11)),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          _checkPhone = !_checkPhone;
                        });
                      },
                      child: SizedBox(
                        width: supportUI.resWidth(16),
                        height: supportUI.resWidth(16),
                        child: Image.asset(_checkPhone?'images/selected_checkbox.png':'images/unselected_checkbox.png'),
                      ),
                    ),
                  ),
                  Text('휴대폰', style: _itemTextStyle,)
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional.topStart,
              child: SizedBox(
                width: supportUI.deviceWidth*5/6,
                child: Text('* 주문정보 등 주요 안내사항은 동의 여부 관계 없이 자동 발송 됩니다.', style: _guideTextStyle, softWrap: true,),
              ),
            )
          ],
        ),
      ),
    );
  }
}