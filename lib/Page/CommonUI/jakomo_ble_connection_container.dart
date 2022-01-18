import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/BLE/ble_controller.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'jakomo_bottomsheet.dart';

class JakomoBLEConnectionContainer extends StatefulWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  const JakomoBLEConnectionContainer({Key? key, required this.supportUI, required this.jakomoColor}):super(key: key);

  @override
  State<StatefulWidget> createState() => _JakomoBLEConnectionContainer();

}

class _JakomoBLEConnectionContainer extends State<JakomoBLEConnectionContainer>{
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  late final TextStyle _connectionTextStyle = TextStyle(
      color: jakomoColor.chambray,
      fontFamily: supportUI.fontNanum('b'),
      fontSize: supportUI.resFontSize(10),
      fontWeight: FontWeight.bold
  );
  final String _popupText = '카이저 1인 리클라이너\n슈렁큰 천연면피 소가죽 체어';
  late final TextStyle _popupTextStyle = TextStyle(
      color: jakomoColor.black,
      fontWeight: FontWeight.bold,
      fontSize: supportUI.resFontSize(12),
      fontFamily: supportUI.fontNanum('b'),
      height: 1.6
  );
  late final JakomoBottomSheet jakomoBottomSheet = JakomoBottomSheet(supportUI: supportUI, jakomoColor: jakomoColor);
  final BLEController bleController = Get.find();
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      if(bleController.isShowBottomSheet.value == false){
        jakomoBottomSheet.showBLEConnectionSuccess(context);
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.deviceWidth*5/6,
      height: supportUI.resWidth(84),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: jakomoColor.white,
          boxShadow: [
            BoxShadow(
              color: jakomoColor.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 10,
            ),
          ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: supportUI.resWidth(16)),
            child: SizedBox(
              width: supportUI.resWidth(44),
              height: supportUI.resWidth(44),
              child: Image.asset('images/control_popup_img.png'),
            ),
          ),
          SizedBox(
            width: supportUI.deviceWidth*5/6 - supportUI.resWidth(120),
            height: supportUI.resWidth(44),
            child: Padding(
              padding: EdgeInsets.only(left: supportUI.resWidth(16)),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  _popupText, style: _popupTextStyle, textAlign: TextAlign.start,
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(right: supportUI.resWidth(16)), child: SizedBox(
            width: supportUI.resWidth(44),
            height: supportUI.resWidth(44),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: SizedBox(
                    width: supportUI.resWidth(20),
                    height: supportUI.resWidth(20),
                    child: Image.asset('images/ble_icon.png'),
                  ),
                ),
                Container(
                  width: supportUI.resWidth(44),
                  height: supportUI.resWidth(20),
                  decoration: BoxDecoration(
                      color: jakomoColor.chambray.withOpacity(0.1),
                      borderRadius: const BorderRadius.all(Radius.circular(4))
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: supportUI.resWidth(2)),
                      child: Text('연결됨', style: _connectionTextStyle,),
                    ),
                  ),
                )
              ],
            ),
          ),)
        ],
      ),
    );
  }


}