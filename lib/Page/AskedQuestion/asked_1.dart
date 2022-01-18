import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'asked_question_item.dart';
import 'asked_question_model.dart';

class Asked1 extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  Asked1({Key? key, required this.supportUI, required this.jakomoColor}):super(key: key);
  final List<AskedquestionModel> _modelList = [
    AskedquestionModel(idx: 1, tag: '신청/결제', title: '결제를 하고 싶어요.'),
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