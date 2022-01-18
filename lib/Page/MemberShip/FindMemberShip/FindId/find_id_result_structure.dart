import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/MemberShip/FindMemberShip/FindId/find_id_result_item.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'find_id_result_model.dart';

class FindIdResultStructure extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;
  FindIdResultStructure({Key? key, required this.supportUI, required this.jakomoColor, required this.commonUI}):super(key: key);
  late final TextStyle _titleTextStyle = TextStyle(
      fontFamily: supportUI.fontNanum('b'),
      fontSize: supportUI.resFontSize(18),
      color: jakomoColor.black,
      fontWeight: FontWeight.bold);
  late final TextStyle _numberTextStyle = TextStyle(
      fontFamily: supportUI.fontPoppings('bold'),
      fontSize: supportUI.resFontSize(12),
      color: jakomoColor.shark,
      fontWeight: FontWeight.bold);

  late final TextStyle _noDataTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontFamily: supportUI.fontNanum('r'),
      fontSize: supportUI.resFontSize(14));

  final List<FindIdResultModel> data = [
    FindIdResultModel(
        date: DateTime(2020, 5, 5),
        id: 'admin_5678***@naver.com'
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: supportUI.commonLeft()),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _resultTitle(),
          Padding(
            padding: EdgeInsets.only(top: supportUI.resHeight(26)),
            child: FindIdResultItem(supportUI: supportUI, jakomoColor: jakomoColor, findIdResultModel: data[0]),
          )
        ],
      ),
    );
  }
  Widget _resultTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '검색결과',
          style: _titleTextStyle,
        ),
        Padding(
          padding: EdgeInsets.only(left: supportUI.resWidth(6)),
          child: Container(
            width: supportUI.resWidth(25),
            height: supportUI.resHeight(24),
            decoration: BoxDecoration(
                color: jakomoColor.porcelain,
                borderRadius: const BorderRadius.all(Radius.circular(4))),
            child: Center(
              child: Text(
                data.length.toString(),
                style: _numberTextStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _noData() {
    return Text(
      '해당 정보의 계정을 찾을 수 없습니다.\n번호를 확인해주세요.',
      style: _noDataTextStyle,
      textAlign: TextAlign.start,
    );
  }
}