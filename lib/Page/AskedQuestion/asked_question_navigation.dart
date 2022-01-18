import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/AskedQuestion/asked_question_controller.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class AskedQuestionNaviagtion extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  AskedQuestionNaviagtion(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);
  final AskedQuestionController askedQuestionController = Get.find();
  final List<String> _navigationList = ['ALL', '신청/결제', '취소/환급', '포인트', '기타'];
  late final TextStyle _enTextStyle = TextStyle(
      color: jakomoColor.shark.withOpacity(0.5),
      fontSize: supportUI.resFontSize(13),
      fontFamily: supportUI.fontPoppings('regular'));
  late final TextStyle _enActivateTextStyle = TextStyle(
      color: jakomoColor.pistachio,
      fontSize: supportUI.resFontSize(13),
      fontFamily: supportUI.fontPoppings('bold'),
      fontWeight: FontWeight.bold);
  late final TextStyle _krTextStyle = TextStyle(
      color: jakomoColor.shark.withOpacity(0.5),
      fontSize: supportUI.resFontSize(13),
      fontFamily: supportUI.fontNanum('r'));
  late final TextStyle _krActivateTextStyle = TextStyle(
      color: jakomoColor.pistachio,
      fontSize: supportUI.resFontSize(13),
      fontFamily: supportUI.fontNanum('eb'),
      fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: supportUI.resWidth(24), bottom: supportUI.resWidth(28)),
      child: SizedBox(
        width: supportUI.deviceWidth - supportUI.resWidth(24),
        height: supportUI.resWidth(40),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
                _navigationList.length,
                (index) => Padding(
                      padding: EdgeInsets.only(right: supportUI.resWidth(10)),
                      child: GestureDetector(
                        onTap: (){
                          askedQuestionController.idx.value = index;
                        },
                        child: Obx((){
                          return _navigationItem(_navigationList[index], askedQuestionController.idx.value == index?true:false);
                        }),
                      ),
                    )),
          ),
        ),
      ),
    );
  }

  Widget _navigationItem(String input, bool state) {
    return Container(
      width: supportUI.resWidth(64),
      height: supportUI.resWidth(40),
      decoration: BoxDecoration(
        color: state
            ? jakomoColor.pistachio.withOpacity(0.1)
            : jakomoColor.transperent,
        borderRadius: const BorderRadius.all(Radius.circular(4))
      ),

      child: Center(
        child: Text(
          input,
          style: _wichTextStyle(input, state),
        ),
      ),
    );
  }

  TextStyle _wichTextStyle(String input, bool state) {
    TextStyle result = _krTextStyle;
    if (input == 'ALL') {
      result = _enTextStyle;
      if (state) {
        result = _enActivateTextStyle;
      }
    }
    if (state) {
      result = _krActivateTextStyle;
    }
    return result;
  }
}
