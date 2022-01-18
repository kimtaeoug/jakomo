import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'as_application_form_controller.dart';

class ASApplicationFormTime extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  ASApplicationFormTime(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);
  late final TextStyle _titleEnTextStyle = TextStyle(
      color: jakomoColor.mineShaft2,
      fontSize: supportUI.resFontSize(16),
      fontWeight: FontWeight.bold,
      fontFamily: supportUI.fontPoppings('semibold'));
  late final TextStyle _titleKrTextStyle = TextStyle(
      color: jakomoColor.mineShaft2,
      fontSize: supportUI.resFontSize(16),
      fontWeight: FontWeight.bold,
      fontFamily: supportUI.fontNanum('eb'));
  final ASApplicationFormController applicationFormController = Get.find();

  @override
  Widget build(BuildContext context) {
    applicationFormController.timeIdx.value = 100;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: supportUI.commonLeft(),
              bottom: supportUI.resWidth(16),
              top: supportUI.resWidth(45)),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: Text.rich(TextSpan(children: [
              TextSpan(text: 'AS ', style: _titleEnTextStyle),
              TextSpan(text: '희망 시간 선택', style: _titleKrTextStyle)
            ])),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: supportUI.commonLeft(), bottom: supportUI.resWidth(32)),
          child: SizedBox(
            width: supportUI.deviceWidth - supportUI.commonLeft(),
            height: supportUI.resWidth(48),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                      _timeList.length,
                      (index) => Padding(
                            padding:
                                EdgeInsets.only(right: supportUI.resWidth(8)),
                            child: GestureDetector(
                              onTap: () {
                                if(index != 1){
                                  applicationFormController.timeIdx.value = index;
                                }
                              },
                              child: _timeItem(
                                  _timeList[index],
                                  index == 1
                                      ? false
                                      : true,
                                  applicationFormController.timeIdx.value ==
                                          index
                                      ? true
                                      : false),
                            ),
                          )),
                );
              }),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: supportUI.resWidth(36)),
            child: _info(),
          ),
        )
      ],
    );
  }

  late final TextStyle _normalTextStyle = TextStyle(
      color: jakomoColor.mineShaft,
      fontWeight: FontWeight.bold,
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontPoppings('regular'));
  late final TextStyle _alreadyTextStyle = TextStyle(
      color: jakomoColor.silver,
      fontWeight: FontWeight.bold,
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontPoppings('regular'));
  late final TextStyle _selectedTextStyle = TextStyle(
      color: jakomoColor.pistachio,
      fontWeight: FontWeight.bold,
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontPoppings('regular'));

  Widget _timeItem(String time, bool state, bool isSelected) {
    Widget result = Container(
      width: supportUI.resWidth(75),
      height: supportUI.resWidth(48),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(28)),
          color: jakomoColor.white,
          border:
              Border.all(color: jakomoColor.alto.withOpacity(0.5), width: 2)),
      child: Center(
        child: Text(
          time,
          style: _normalTextStyle,
        ),
      ),
    );
    //state - false -> 선택 불가
    if (!state) {
      result = Container(
        width: supportUI.resWidth(75),
        height: supportUI.resWidth(48),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(28)),
          color: jakomoColor.alto.withOpacity(0.2),
        ),
        child: Center(
          child: Text(
            time,
            style: _alreadyTextStyle,
          ),
        ),
      );
    }
    if (isSelected) {
      result = Container(
        width: supportUI.resWidth(75),
        height: supportUI.resWidth(48),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(28)),
            color: jakomoColor.pistachio.withOpacity(0.2),
            border: Border.all(color: jakomoColor.pistachio, width: 2)),
        child: Center(
          child: Text(
            time,
            style: _selectedTextStyle,
          ),
        ),
      );
    }
    return result;
  }

  final List<String> _timeList = [
    '09:00',
    '10:00',
    '11:00',
    '12:00',
    '13:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00'
  ];

  late final TextStyle _infoTextStyle = TextStyle(
      color: jakomoColor.red,
      fontFamily: supportUI.fontNanum('eb'),
      fontSize: supportUI.resFontSize(12),
      fontWeight: FontWeight.bold);
  late final TextStyle _guideTextStyle = TextStyle(
      color: jakomoColor.black,
      fontWeight: FontWeight.w400,
      height: 1.6,
      fontSize: supportUI.resFontSize(13),
      fontFamily: supportUI.fontNanum('r'));

  Widget _info() {
    return Container(
      width: supportUI.deviceWidth * 5 / 6,
      height: supportUI.resWidth(115),
      decoration: BoxDecoration(
          color: jakomoColor.chablis,
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: supportUI.resWidth(17), bottom: supportUI.resWidth(6)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: supportUI.resWidth(4), top: supportUI.resWidth(3)),
                    child: SizedBox(
                      width: supportUI.resWidth(15),
                      height: supportUI.resWidth(15),
                      child: Image.asset('images/red_info_icon.png'),
                    ),
                  ),
                  SizedBox(
                    height: supportUI.resWidth(15),
                    child: Center(
                      child: Text(
                        '알림',
                        style: _infoTextStyle,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: supportUI.resWidth(17)),
              child: SizedBox(
                width: supportUI.resWidth(270),
                height: supportUI.resWidth(61),
                child: Text(
                  '현재 입력하신 날짜와 시간은 희망하는 시간이므로 확정이 아닙니다. 날짜와 시간은 상담을 통해 확정되며 AS는 확정된 날짜와 시간에 진행됩니다.',
                  style: _guideTextStyle,
                  softWrap: true,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
