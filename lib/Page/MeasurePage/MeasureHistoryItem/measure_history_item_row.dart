import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureHistoryItem/measure_history_item_model.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class MeasureHistoryItemRow extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final String tag;
  final MeasureHistoryItemModel measureHistoryItemModel;
  final CommonUI commonUI;
  MeasureHistoryItemRow({Key? key, required this.supportUI, required this.jakomoColor, required this.tag, required this.measureHistoryItemModel, required this.commonUI}):super(key: key);

  late final TextStyle _tagTextStyle = TextStyle(
    color: jakomoColor.boulder,
    fontSize: supportUI.resFontSize(14),
    fontFamily: supportUI.fontNanum('b'),
    fontWeight: FontWeight.w400
  );
  late final TextStyle _valueTextStyle = TextStyle(
    color: jakomoColor.black,
    fontWeight: FontWeight.bold,
    fontSize: supportUI.resFontSize(14),
    fontFamily: supportUI.fontPoppings('semibold')
  );
  late final TextStyle _unitTextStyle = TextStyle(
    fontFamily: supportUI.fontPoppings('semibold'),
    fontSize: supportUI.resFontSize(12),
    color: jakomoColor.boulder,
    fontWeight: FontWeight.bold
  );
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: supportUI.deviceWidth*5/6-4-supportUI.resWidth(40),
      height: supportUI.resHeight(48),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(convertTag(tag), style: _tagTextStyle, textAlign: TextAlign.start,),
              tag != 'stress'?
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(getValue(tag, measureHistoryItemModel).toString(), style: _valueTextStyle,),
                  Padding(
                    padding: EdgeInsets.only(left: supportUI.resWidth(1)),
                    child: Text(unit(tag), style: _unitTextStyle,),
                  )
                ],
              ):commonUI.stressUI(measureHistoryItemModel.stress)
            ],
          ),
          Container(
            width: supportUI.deviceWidth*5/6-4-supportUI.resWidth(40),
            height: supportUI.resHeight(1),
            color: jakomoColor.dustyGray.withOpacity(0.1),
          )
        ],
      ),
    );
  }
  dynamic getValue(String tag, MeasureHistoryItemModel measureHistoryItemModel){
    dynamic result = '${measureHistoryItemModel.systolic}/${measureHistoryItemModel.diastolic}';
    switch(tag){
      case 'heartRate':
        result = measureHistoryItemModel.heartRate.toString();
        break;
      case 'stress':
        result = measureHistoryItemModel.stress;
        break;
      case 'weight':
        result = measureHistoryItemModel.weight.toString();
        break;
    }
    return result;
  }
  String convertTag(String tag){
    String result = '혈압';
    switch(tag){
      case 'heartRate':
        result = '심박수';
        break;
      case 'stress':
        result = '스트레스';
        break;
      case 'weight':
        result = '몸무게';
        break;
    }
    return result;
  }
  String unit(String tag){
    String result = 'mmHg';
    switch(tag){
      case 'heartRate':
        result = 'bpm';
        break;
      case 'weight':
        result = 'kg';
        break;
    }
    return result;
  }
}
