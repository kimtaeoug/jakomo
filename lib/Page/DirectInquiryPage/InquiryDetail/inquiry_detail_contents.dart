import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/Page/DirectInquiryPage/InquiryDetail/inquiry_detail_answer.dart';
import 'package:jakomo_recliner/Page/DirectInquiryPage/InquiryHistory/inquiry_history_model.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class InquiryDetailContents extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final InquiryHistoryModel applicationHistoryModel;

  InquiryDetailContents(
      {Key? key,
        required this.supportUI,
        required this.jakomoColor,
        required this.applicationHistoryModel})
      : super(key: key);
  late final TextStyle _replacementTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontNanum('r'));
  late final TextStyle _titleTextStyle = TextStyle(
      color: jakomoColor.black,
      fontSize: supportUI.resFontSize(16),
      fontFamily: supportUI.fontNanum('b'),
      fontWeight: FontWeight.bold);
  late final TextStyle _stateTextStyle1 = TextStyle(
      color: jakomoColor.pistachio,
      fontSize: supportUI.resFontSize(10),
      fontFamily: supportUI.fontNanum('b'));
  late final TextStyle _stateTextStyle2 = TextStyle(
      color: jakomoColor.boulder,
      fontSize: supportUI.resFontSize(10),
      fontFamily: supportUI.fontNanum('b'));
  late final TextStyle _contentsTextStyle = TextStyle(
    color: jakomoColor.boulder,
    fontSize: supportUI.resFontSize(14),
    fontFamily: supportUI.fontNanum('r'),
  );
  late final TextStyle _dateTextStyle = TextStyle(
    color: jakomoColor.boulder,
    fontSize: supportUI.resFontSize(12),
    fontFamily: supportUI.fontPoppings('regular')
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.deviceWidth * 8 / 9,
      decoration: BoxDecoration(
          color: jakomoColor.athensGray,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: supportUI.resWidth(31), left: supportUI.resWidth(20)),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                '결제',
                style: _replacementTextStyle,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: supportUI.resWidth(20), bottom: supportUI.resWidth(20)),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                applicationHistoryModel.title,
                style: _titleTextStyle,
              ),
            ),
          ),
          SizedBox(
            width: supportUI.deviceWidth * 7 / 9,
            child: Text(
              applicationHistoryModel.contents,
              style: _contentsTextStyle,
              softWrap: true,
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                  top: supportUI.resWidth(25),
                  bottom: supportUI.resWidth(16)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                    applicationHistoryModel.img.length,
                        (index) => Padding(
                      padding:
                      EdgeInsets.only(bottom: supportUI.resWidth(5)),
                      child: Container(
                        width: supportUI.deviceWidth * 7 / 9,
                        height: supportUI.resWidth(175),
                        decoration: BoxDecoration(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(4)),
                            image: DecorationImage(
                                image: AssetImage(
                                    'images/${applicationHistoryModel.img[index]}.png'),
                                fit: BoxFit.fill)),
                      ),
                    )),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: supportUI.resWidth(20)), child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: supportUI.resWidth(20)),
                child: SizedBox(
                  height: supportUI.resWidth(20),
                  child: Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Text(applicationHistoryModel.date, style: _dateTextStyle,),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: supportUI.resWidth(20)),
                child: _convertState(applicationHistoryModel.state),
              )
            ],
          ),),
          applicationHistoryModel.state !=2
              ? InquiryDetailAnswer(
              supportUI: supportUI,
              jakomoColor: jakomoColor,
              applicationHistoryModel: applicationHistoryModel)
              : Container()
        ],
      ),
    );
  }

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
