
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class InquiryFormGuide extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  InquiryFormGuide(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);
  late final TextStyle _titleTextStyle = TextStyle(
      color: jakomoColor.mineShaft,
      fontSize: supportUI.resFontSize(12),
      fontFamily: supportUI.fontNanum('r')
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: supportUI.resWidth(20)),
      child: Container(
        width: supportUI.deviceWidth*5/6,
        height: supportUI.resWidth(52),
        decoration: BoxDecoration(
            color: jakomoColor.white,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                color: jakomoColor.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 10,
              ),
            ]
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: supportUI.resWidth(14), right: supportUI.resWidth(8)),
                child: Container(
                  width: supportUI.resWidth(28),
                  height: supportUI.resWidth(28),
                  decoration: BoxDecoration(
                      color: jakomoColor.gallery,
                      shape: BoxShape.circle
                  ),
                  child: Center(
                    child: SizedBox(
                      width: supportUI.resWidth(16),
                      height: supportUI.resWidth(16),
                      child: Image.asset('images/lined_info_icon.png'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: supportUI.resWidth(28),
                child: Center(
                  child: Text('한번 등록한 문의는 변경 삭제가 불가합니다.', style: _titleTextStyle,),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}