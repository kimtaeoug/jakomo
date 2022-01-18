import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class ASApplicationFormFooter extends StatefulWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  ASApplicationFormFooter(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);
  late final TextStyle _checkBoxTextStyle = TextStyle(
      color: jakomoColor.mineShaft,
      fontWeight: FontWeight.w400,
      fontFamily: supportUI.fontNanum('r'),
      fontSize: supportUI.resFontSize(14));

  @override
  State<StatefulWidget> createState() => _ASApplicationFormFooter();
}

class _ASApplicationFormFooter extends State<ASApplicationFormFooter> {
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  late final TextStyle _checkBoxTextStyle = widget._checkBoxTextStyle;
  bool _clicked = false;
  late final CommonUI commonUI = CommonUI(supportUI: supportUI, jakomoColor: jakomoColor);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: supportUI.commonLeft(),
              top: supportUI.resWidth(22),
              bottom: supportUI.resWidth(28)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _clicked = !_clicked;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(right: supportUI.resWidth(13), top: supportUI.resWidth(3)),
                  child: SizedBox(
                    height: supportUI.resWidth(46),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: SizedBox(
                        width: supportUI.resWidth(16),
                        height: supportUI.resWidth(16),
                        child: Image.asset(_clicked
                            ? 'images/selected_checkbox.png'
                            : 'images/unselected_checkbox.png'),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: supportUI.resWidth(253),
                height: supportUI.resWidth(46),
                child: Text(
                  '[필수] AS신청을 위한 개인 정보 취급 방침을 확인하였으며, 이에 동의합니다.',
                  style: _checkBoxTextStyle,
                  textAlign: TextAlign.start,
                  softWrap: true,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: supportUI.resWidth(24)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: commonUI.concreteButton('취소'),
              ),
              Padding(
                padding: EdgeInsets.only(left: supportUI.resWidth(8)),
                child: GestureDetector(
                  onTap: () {},
                  child: commonUI.pistachioSmallButton('신청하기'),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

}
