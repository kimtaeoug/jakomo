import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'asked_question_item.dart';
import 'asked_question_model.dart';

class AskedQuestionStructure extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final int idx;
  AskedQuestionStructure(
      {Key? key, required this.supportUI, required this.jakomoColor, required this.idx})
      : super(key: key);
  final List<AskedquestionModel> _modelList = [
    AskedquestionModel(idx:1, tag: '신청/결제', title: '결제를 하고 싶어요.'),
    AskedquestionModel(idx:2, tag: '취소/환급', title: '환급을 어떻게 하나요?'),
    AskedquestionModel(idx:4, tag: '기타', title: '회원 탈퇴를 어떻게 하나요?')
  ];
  @override
  Widget build(BuildContext context) {
    return _listStructure(idx);
  }
  Widget _listStructure(int idx){
    List<AskedquestionModel> resultList = [];
    if(idx == 0){
      resultList = _modelList;
    }else{
      resultList = _wichList(idx);
    }
    if(resultList.isNotEmpty){
      return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(resultList.length, (index) => Padding(
            padding: EdgeInsets.only(bottom: resultList.length == index?supportUI.resWidth(164):supportUI.resWidth(16),),
            child: AskedquestionItem(supportUI: supportUI, jakomoColor: jakomoColor, askedquestionModel: resultList[index]),
          ))
      );
    }else{
      return Container();
    }
  }
  List<AskedquestionModel> _wichList(int idx){
    List<AskedquestionModel> resultList = [];
    for(AskedquestionModel data in _modelList){
      if(data.idx == idx){
        resultList.add(data);
      }
    }
    return resultList;
  }
}