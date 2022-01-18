import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/DirectInquiryPage/InquiryDetail/inquiry_detail_page.dart';
import 'package:jakomo_recliner/Page/DirectInquiryPage/InquiryHistory/inquiry_history_model.dart';
import 'package:jakomo_recliner/Routes/jakomo_routes.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class InquiryHistoryItem extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final InquiryHistoryModel inquiryHistoryModel;
  InquiryHistoryItem({Key? key, required this.supportUI, required this.jakomoColor, required this.inquiryHistoryModel}):super(key: key);
  late final TextStyle _replacementTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontFamily: supportUI.fontNanum('r'),
      fontSize: supportUI.resFontSize(14));
  late final TextStyle _titleTextStyle = TextStyle(
      color: jakomoColor.black,
      fontSize: supportUI.resFontSize(16),
      fontFamily: supportUI.fontNanum('eb'),
      fontWeight: FontWeight.bold);
  late final TextStyle _dateTextStyle = TextStyle(
    color: jakomoColor.silverChalice,
    fontSize: supportUI.resFontSize(12),
    fontFamily: supportUI.fontPoppings('regular'),
  );
  late final TextStyle _stateTextStyle1 = TextStyle(
      color: jakomoColor.pistachio,
      fontSize: supportUI.resFontSize(10),
      fontFamily: supportUI.fontNanum('b'));
  late final TextStyle _stateTextStyle2 = TextStyle(
      color: jakomoColor.boulder,
      fontSize: supportUI.resFontSize(10),
      fontFamily: supportUI.fontNanum('b'));
  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.deviceWidth * 8 /9,
      height: supportUI.resWidth(164),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: jakomoColor.athensGray
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: supportUI.resWidth(24)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: supportUI.resWidth(20)),
                      child: Text('결제', style: _replacementTextStyle,),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: supportUI.resWidth(20)),
                      child: GestureDetector(
                        onTap: (){
                          Get.toNamed(JakomoRoutes.inquiryDetail, arguments: inquiryHistoryModel);
                        },
                        child: SizedBox(
                          width: supportUI.resWidth(18),
                          height: supportUI.resWidth(18),
                          child: Image.asset('images/left_icon.png'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: supportUI.resWidth(20), top: supportUI.resWidth(2)),
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    inquiryHistoryModel.title,
                    style: _titleTextStyle,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: supportUI.resWidth(22)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: supportUI.resWidth(20)),
                  child: Text(
                    inquiryHistoryModel.date, style: _dateTextStyle,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: supportUI.resWidth(20)),
                  child: _convertState(inquiryHistoryModel.state),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  //1 - 답변 완료
  //2 - 답변 대
  Widget _convertState(int idx) {
    Widget result = Container(
      width: supportUI.resWidth(52),
      height: supportUI.resWidth(20),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: jakomoColor.pistachio),
          color: jakomoColor.transperent
      ),
      child: Center(
        child: Text('답변완료', style: _stateTextStyle1,),
      ),
    );
    if(idx == 2){
      result = Container(
        width: supportUI.resWidth(52),
        height: supportUI.resWidth(20),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            color: jakomoColor.white),
        child: Center(
          child: Text(
            '답변대기',
            style: _stateTextStyle2,
          ),
        ),
      );
    }
    return result;
  }
}