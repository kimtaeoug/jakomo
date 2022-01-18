import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class BLEControlDeviceItem extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final TextStyle itemTextStyle;
  final String img;
  const BLEControlDeviceItem({Key? key,
    required this.supportUI,
    required this.jakomoColor,
    required this.itemTextStyle,
    required this.img,
  }):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.resWidth(60) ,
      height: supportUI.resWidth(48),
      decoration: BoxDecoration(
          color: jakomoColor.alabaster,
          borderRadius: const BorderRadius.all(Radius.circular(14)),
          border: Border.all(color: jakomoColor.alto),
          boxShadow: [
            BoxShadow(
              color: jakomoColor.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 10,
            ),
          ]
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: supportUI.resWidth(18),
              height: supportUI.resWidth(18),
              child: Image.asset('images/$img.png'),
            ),
            Text(
              img == 'right_arrow_icon'? '오른쪽':'왼쪽', style: itemTextStyle,
            )
          ],
        ),
      ),
    );
  }
}