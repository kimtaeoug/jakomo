import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_bottomsheet.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_loading_cupertino.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class BLEConnectionSwitch extends StatefulWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  BLEConnectionSwitch(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);
  late final TextStyle _bleTextStyle = TextStyle(
      color: jakomoColor.chambray,
      fontWeight: FontWeight.bold,
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontNanum('b'));

  @override
  State<StatefulWidget> createState() => _BLEConnectionSwitch();
}

class _BLEConnectionSwitch extends State<BLEConnectionSwitch> {
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  late final TextStyle _bleTextStyle = widget._bleTextStyle;

  late final JakomoBottomSheet jakomoBottomSheet = JakomoBottomSheet(supportUI: supportUI, jakomoColor: jakomoColor);
  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.deviceWidth * 5 / 6,
      height: supportUI.resWidth(56),
      decoration: BoxDecoration(
          color: jakomoColor.white,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: Center(
        child: SizedBox(
          height: supportUI.resWidth(24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: supportUI.resWidth(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    clicked ? _loading() : _bleIcon(),
                    Padding(
                      padding: EdgeInsets.only(left: supportUI.resWidth(8)),
                      child: Text(
                        clicked?'리클라이너 연결중':'리클라이너 연결하기',
                        style: _bleTextStyle,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: supportUI.resWidth(16)),
                child: _switch(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _bleIcon() {
    return SizedBox(
      width: supportUI.resWidth(20),
      height: supportUI.resWidth(20),
      child: Image.asset('images/ble_icon.png'),
    );
  }

  Widget _loading() {
    return SizedBox(
      width: supportUI.resWidth(20),
      height: supportUI.resWidth(20),
      child: JakomoLoadingCupertino(
          animating: true,
          radius: 10,
          tickCount: 8,
          activeColor: jakomoColor.chambray,
          inactiveColor: jakomoColor.athensGray2,
          animationDuration: const Duration(seconds: 1),
          relativeWidth: 1,
          startRatio: 0.4,
          endRatio: 1.0),
    );
  }

  Widget _switch() {
    return GestureDetector(
      onTap: () => setState(() {
        clicked = !clicked;
      }),
      child: Container(
        width: supportUI.resWidth(40),
        height: supportUI.resWidth(24),
        decoration: BoxDecoration(
          color: clicked ? jakomoColor.chambray : jakomoColor.silver,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Center(
          child: SizedBox(
            width: supportUI.resWidth(32),
            height: supportUI.resWidth(16),
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 300),
              alignment: clicked
                  ? AlignmentDirectional.centerEnd
                  : AlignmentDirectional.centerStart,
              child: Container(
                width: supportUI.resWidth(16),
                height: supportUI.resWidth(16),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: jakomoColor.white,
                    boxShadow: [
                      BoxShadow(
                        color: jakomoColor.grey.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 10,
                        // offset: const Offset(4.0, 2.0)
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
