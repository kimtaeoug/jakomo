import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'asked_question_item.dart';
import 'asked_question_model.dart';

class AskedAll extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  AskedAll({Key? key, required this.supportUI, required this.jakomoColor}):super(key: key);
  final List<AskedquestionModel> _modelList = [
    AskedquestionModel(idx: 1, tag: '신청/결제', title: '결제를 하고 싶어요.'),
    AskedquestionModel(idx: 2, tag: '취소/환급', title: '환급을 어떻게 하나요?'),
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