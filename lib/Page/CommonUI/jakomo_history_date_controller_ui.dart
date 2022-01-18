//jakomo_history_date_controller_ui
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

typedef void voidFunc();
class JakomoHistoryDateControllerUI extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final voidFunc left;
  final voidFunc right;
  final String date;
  JakomoHistoryDateControllerUI({
    Key? key,
    required this.supportUI,
    required this.jakomoColor,
    required this.left,
    required this.right,
    required this.date
  }):super(key: key);
  late final TextStyle _dateTextStyle = TextStyle(
    color: jakomoColor.black,
    fontFamily: supportUI.fontPoppings('semibold'),
    fontSize: supportUI.resFontSize(20),
    fontWeight: FontWeight.bold
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: supportUI.resHeight(24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: supportUI.commonLeft()),
            child: GestureDetector(
              onTap: () => left,
              child: Container(
                width: supportUI.resWidth(44),
                height: supportUI.resWidth(44),
                decoration: BoxDecoration(
                  color: jakomoColor.seaShell2,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SizedBox(
                    width: supportUI.resWidth(5.5),
                    height: supportUI.resWidth(12),
                    child: Image.asset('images/back_icon.png', fit: BoxFit.fitHeight,),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: supportUI.resWidth(44),
            child: Center(
              child: Text(date, style: _dateTextStyle,),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: supportUI.commonLeft()),
            child: GestureDetector(
              onTap: () => right,
              child: Container(
                width: supportUI.resWidth(44),
                height: supportUI.resWidth(44),
                decoration: BoxDecoration(
                  color: jakomoColor.pistachio,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SizedBox(
                    width: supportUI.resWidth(5.5),
                    height: supportUI.resWidth(12),
                    child: Image.asset('images/next_icon.png', fit: BoxFit.fitHeight,),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}