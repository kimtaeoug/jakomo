import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_bottomsheet.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class WidthDrawalFooter extends StatefulWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;

  const WidthDrawalFooter(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.commonUI})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _WidthDrawalFooter();
}

class _WidthDrawalFooter extends State<WidthDrawalFooter> {
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  late final CommonUI commonUI = widget.commonUI;
  late final TextStyle _textStyle = TextStyle(
      color: jakomoColor.boulder,
      fontWeight: FontWeight.w300,
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontNanum('r'));
  bool _clicked = false;
  late final JakomoBottomSheet jakomoBottomSheet = JakomoBottomSheet(supportUI: supportUI, jakomoColor: jakomoColor);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: supportUI.resWidth(28), bottom: supportUI.resWidth(23)),
          child: Container(
            width: supportUI.deviceWidth,
            height: supportUI.resWidth(8),
            color: jakomoColor.blackHaze2,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: supportUI.commonLeft(), bottom: supportUI.resWidth(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: supportUI.getTextSize('필수\n동의', _textStyle).height,
                child: Padding(
                  padding: EdgeInsets.only(right: supportUI.resWidth(11), top: supportUI.resWidth(3)),
                  child: GestureDetector(
                    onTap: () => setState(() {
                      _clicked = !_clicked;
                    }),
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
              Text(
                '[필수] 탈퇴 정책을 확인하였으며, 이에\n동의합니다.',
                style: _textStyle,
                softWrap: true,
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: supportUI.resWidth(24)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: supportUI.resWidth(8)),
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: commonUI.concreteButton('취소'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  jakomoBottomSheet.showWidthDrawal(context);
                },
                child: commonUI.pistachioSmallButton('회원탈퇴'),
              )
            ],
          ),
        )
      ],
    );
  }
}
