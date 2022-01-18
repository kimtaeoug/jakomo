import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/ASApplicationPage/as_application_history_model.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Routes/jakomo_routes.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class ASApplicationHistoryItem extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;
  final ASApplicationHistoryModel applicationHistoryModel;

  ASApplicationHistoryItem(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
        required this.commonUI,
      required this.applicationHistoryModel})
      : super(key: key);
  late final TextStyle _replacementTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontFamily: supportUI.fontNanum('r'),
      fontSize: supportUI.resFontSize(14));
  late final TextStyle _titleTextStyle = TextStyle(
      color: jakomoColor.black,
      fontSize: supportUI.resFontSize(16),
      fontFamily: supportUI.fontNanum('eb'),
      fontWeight: FontWeight.bold);
  late final TextStyle _stateDateTextStyle = TextStyle(
      color: jakomoColor.pistachio,
      fontWeight: FontWeight.bold,
      fontFamily: supportUI.fontPoppings('semibold'),
      fontSize: supportUI.resFontSize(13));
  late final TextStyle _stateDateTextStyle2 = TextStyle(
      color: jakomoColor.silver,
      fontWeight: FontWeight.bold,
      fontFamily: supportUI.fontPoppings('semibold'),
      fontSize: supportUI.resFontSize(13));
  late final TextStyle _dateTextStyle = TextStyle(
    color: jakomoColor.boulder,
    fontSize: supportUI.resFontSize(14),
    fontFamily: supportUI.fontPoppings('regular'),
  );
  late final TextStyle _pmTextStyle = TextStyle(
      fontFamily: supportUI.fontNanum('r'),
      color: jakomoColor.boulder,
      fontWeight: FontWeight.w400,
      fontSize: supportUI.resFontSize(14));

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: supportUI.resWidth(180),
          child: Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Container(
              width: supportUI.deviceWidth * 8 / 9,
              height: supportUI.resWidth(164),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: applicationHistoryModel.state == 1
                          ? jakomoColor.pistachio
                          : jakomoColor.athensGray),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  color: applicationHistoryModel.state == 1
                      ? jakomoColor.white
                      : jakomoColor.athensGray),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: supportUI.resWidth(24),
                        bottom: supportUI.resWidth(2)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: supportUI.resWidth(20)),
                          child: Text(
                            '교환',
                            style: _replacementTextStyle,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(right: supportUI.resWidth(20)),
                          child: GestureDetector(
                            onTap: () {
                            Get.toNamed(JakomoRoutes.asDetail, arguments: applicationHistoryModel);
                            },
                            child: SizedBox(
                              width: supportUI.resWidth(18),
                              height: supportUI.resWidth(18),
                              child: Image.asset('images/left_icon.png'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: supportUI.resWidth(2),
                        left: supportUI.resWidth(20)),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        applicationHistoryModel.title,
                        style: _titleTextStyle,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: supportUI.resWidth(20)),
                        child: Text(
                          _convertStateText(applicationHistoryModel.state),
                          style: applicationHistoryModel.state == 2
                              ? _stateDateTextStyle2
                              : _stateDateTextStyle,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: supportUI.resWidth(12),
                            right: supportUI.resWidth(8)),
                        child: Text(
                          applicationHistoryModel.date,
                          style: _dateTextStyle,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: supportUI.resWidth(8)),
                        child: Container(
                          width: supportUI.resWidth(1),
                          height: supportUI.resWidth(10),
                          color: jakomoColor.boulder.withOpacity(0.3),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: supportUI.resWidth(4)),
                        child: Text(
                          '오후',
                          style: _pmTextStyle,
                        ),
                      ),
                      Text(
                        applicationHistoryModel.time,
                        style: _dateTextStyle,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: supportUI.resWidth(26),
                        right: supportUI.resWidth(20)),
                    child: Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: commonUI.convertState(applicationHistoryModel.state),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        applicationHistoryModel.state == 1
            ? Align(
                alignment: AlignmentDirectional.topEnd,
                child: SizedBox(
                  height: supportUI.resWidth(180),
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: supportUI.resWidth(36),
                        top: supportUI.resWidth(5)),
                    child: Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: SizedBox(
                        width: supportUI.resWidth(164),
                        height: supportUI.resWidth(24),
                        child: Image.asset('images/coming_to_visit.png'),
                      ),
                    ),
                  ),
                ),
              )
            : Container()
      ],
    );
  }

  String _convertStateText(int idx) {
    String result = 'AS 방문일';
    switch (idx) {
      case 2:
        result = 'AS 희망 방문일';
        break;
      case 3:
        result = 'AS 희망 방문일';
        break;
      case 4:
        result = 'AS 방문일';
        break;
    }
    return result;
  }
}
