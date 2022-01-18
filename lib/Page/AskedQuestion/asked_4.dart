import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'asked_question_item.dart';
import 'asked_question_model.dart';

class Asked4 extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  Asked4({Key? key, required this.supportUI, required this.jakomoColor}):super(key: key);
  final List<AskedquestionModel> _modelList = [
    AskedquestionModel(idx: 4, tag: '기타', title: '회원 탈퇴를 어떻게 하나요?')
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(
            _modelList.length,
                (index){
              return AskedquestionItem(
                  supportUI: supportUI,
                  jakomoColor: jakomoColor,
                  askedquestionModel: _modelList[index]);
            }));
  }

}