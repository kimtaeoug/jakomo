import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class JakomoNewsIdx extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final int idx;
  final int totalLength;
  JakomoNewsIdx({Key? key, required this.supportUI, required this.jakomoColor, required this.idx, required this.totalLength})
      : super(key: key);
  late final TextStyle _idxTextStyle = TextStyle(
    color: jakomoColor.white,
    fontWeight: FontWeight.bold,
    fontFamily: supportUI.fontPoppings('regular'),
    fontSize: supportUI.resFontSize(10)
  );
  late final TextStyle _totalTextStyle = TextStyle(
      color: jakomoColor.silverChalice2,
      fontWeight: FontWeight.bold,
      fontFamily: supportUI.fontPoppings('regular'),
      fontSize: supportUI.resFontSize(10)
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.resWidth(48),
      height: supportUI.resWidth(24),
      decoration: BoxDecoration(
        color: jakomoColor.black.withOpacity(0.3),
        borderRadius: const BorderRadius.all(Radius.circular(12))
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: supportUI.resWidth(14),
              child: Center(
                child: Text('0$idx', style: _idxTextStyle,),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: supportUI.resWidth(3)),
              child: Container(
                width: supportUI.resWidth(1),
                height: supportUI.resWidth(14),
                color: jakomoColor.silverChalice2,
              ),
            ),
            SizedBox(
              height: supportUI.resWidth(14),
              child: Center(
                child: Text('0$totalLength', style: _totalTextStyle,),
              ),
            )
          ],
        ),
      ),
    );
  }
  
}