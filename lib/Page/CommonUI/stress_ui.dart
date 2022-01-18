import 'package:flutter/material.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class StressUI extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final int value;
  const StressUI({Key? key, required this.supportUI, required this.jakomoColor, required this.value}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: supportUI.resWidth(20),
          height: supportUI.resHeight(20),
          child: Image.asset(_stressIcon(value), fit: BoxFit.fill,),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: supportUI.resWidth(4)),
          child: SizedBox(
            height: supportUI.resHeight(20),
            child: Center(
              child: Text(_stressEvaluation(value), style: _stressEvalutationTextStyle(value),),
            ),
          ),
        ),
        SizedBox(
          height: supportUI.resHeight(20),
          child: Center(
            child: Text(value.toString(), style: _stressValueTextStyle(value),),
          ),
        )
      ],
    );
  }

  TextStyle _stressEvalutationTextStyle(int value){
    Color resultColor = jakomoColor.fruitSalad;
    if(value < 20){
      resultColor =jakomoColor.fruitSalad;
    }else if(value >= 20 && value < 40){
      resultColor = jakomoColor.feijoa;
    }else if(value >= 40 && value < 60){
      resultColor =jakomoColor.candleLight;
    }else if(value >= 60 && value < 80){
      resultColor = jakomoColor.coral;
    }else if(value >= 80){
      resultColor = jakomoColor.alizarinCrimson;
    }
    return TextStyle(
        fontFamily: supportUI.fontNanum('b'),
        fontSize: supportUI.resFontSize(14),
        color: resultColor
    );
  }
  TextStyle _stressValueTextStyle(int value){
    Color resultColor = jakomoColor.fruitSalad;
    if(value < 20){
      resultColor =jakomoColor.fruitSalad;
    }else if(value >= 20 && value < 40){
      resultColor = jakomoColor.feijoa;
    }else if(value >= 40 && value < 60){
      resultColor =jakomoColor.candleLight;
    }else if(value >= 60 && value < 80){
      resultColor = jakomoColor.coral;
    }else if(value >= 80){
      resultColor = jakomoColor.alizarinCrimson;
    }
    return TextStyle(
        fontFamily: supportUI.fontPoppings('semibold'),
        fontSize: supportUI.resFontSize(14),
        color: resultColor
    );
  }
  String _stressIcon(int value){
    String img = 'images/great_icon.png';
    if(value < 20){
      img = 'images/great_icon.png';
    }else if(value >= 20 && value < 40){
      img = 'images/good_icon.png';
    }else if(value >= 40 && value < 60){
      img = 'images/normal_icon.png';
    }else if(value >= 60 && value < 80){
      img = 'images/not_good_icon.png';
    }else if(value >= 80){
      img = 'images/bad_icon.png';
    }
    return img;
  }
  String _stressEvaluation(int value){
    String result = '매우 좋음';
    if(value < 20){
      result = '매우 좋음';
    }else if(value >= 20 && value < 40){
      result = '좋음';
    }else if(value >= 40 && value < 60){
      result = '보통';
    }else if(value >= 60 && value < 80){
      result = '나쁨';
    }else if(value >= 80){
      result = '매우 나쁨';
    }
    return result;
  }

}