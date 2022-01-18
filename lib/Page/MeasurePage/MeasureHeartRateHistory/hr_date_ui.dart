import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'hr_history_controller.dart';

class HRDateUI extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  HRDateUI({Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);
  late final TextStyle _dateTextStyle = TextStyle(
      color: jakomoColor.black,
      fontFamily: supportUI.fontPoppings('semibold'),
      fontSize: supportUI.resFontSize(20),
      fontWeight: FontWeight.bold);
  final HRHistoryController historyController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: EdgeInsets.only(top: supportUI.resHeight(24)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: supportUI.commonLeft()),
              child: GestureDetector(
                onTap: (){
                  historyController.date.value = historyController
                      .convertAgoDay(historyController.date.value);
                  historyController.dateListAgoDay();
                },
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
                      child: Image.asset(
                        'images/back_icon.png',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: supportUI.resWidth(44),
              child: Center(
                child: Text(
                 historyController.convertToYM(historyController.date.value),
                  style: _dateTextStyle,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: supportUI.commonLeft()),
              child: GestureDetector(
                onTap: () {
                  historyController.date.value = historyController
                      .convertNextDay(historyController.date.value);
                  historyController.dateListNextDay();
                },
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
                      child: Image.asset(
                        'images/next_icon.png',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
