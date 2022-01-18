import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/BLE/ble_controller.dart';
import 'package:jakomo_recliner/Page/BLEControlPage/ble_navigation_controller.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureProgressPage/measure_progress_controller.dart';
import 'package:jakomo_recliner/Page/MemberShip/FindMemberShip/FindPwd/find_pwd_controller.dart';
import 'package:jakomo_recliner/Routes/jakomo_routes.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class JakomoBottomSheet {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  JakomoBottomSheet({required this.supportUI, required this.jakomoColor});
  late final CommonUI commonUI = CommonUI(supportUI: supportUI, jakomoColor: jakomoColor);
  late final TextStyle _concreteTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontSize: supportUI.resFontSize(13),
      fontFamily: supportUI.fontNanum('b'));
  late final TextStyle _smallPistachioTextStyle = TextStyle(
      color: jakomoColor.white,
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontNanum('b'));

  late final TextStyle _errorTitleTextStyle = TextStyle(
      fontSize: supportUI.resFontSize(24),
      fontFamily: supportUI.fontNanum('eb'),
      fontWeight: FontWeight.bold,
      color: jakomoColor.black);
  late final TextStyle _errorContentsTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontNanum('r'));

  final String _errorContents =
      '블루투스 연결에 실패했습니다.\n연결을 위해 블루투스가 켜져 있는지 확인 후,\n재 연결 부탁드립니다.';
  Future<void> showBLEConnectionFail(BuildContext context) async {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            width: supportUI.deviceWidth,
            height: supportUI.resHeight(260),
            decoration: BoxDecoration(
              color: jakomoColor.white,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    '연결 오류',
                    style: _errorTitleTextStyle,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: supportUI.resHeight(24),
                        top: supportUI.resHeight(8)),
                    child: Text(
                      _errorContents,
                      style: _errorContentsTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: _concreteContainer('재 연결하기'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: supportUI.resWidth(8)),
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: _smallPistachioContainer('확인'),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
        isScrollControlled: false,
        enableDrag: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))));
  }

  late final TextStyle _connectionTitleTextStyle = TextStyle(
      color: jakomoColor.black,
      fontFamily: supportUI.fontNanum('eb'),
      fontSize: supportUI.resFontSize(24),
      fontWeight: FontWeight.bold);
  late final TextStyle _connectionContentsTextStyle = TextStyle(
    color: jakomoColor.boulder,
    fontSize: supportUI.resFontSize(14),
    fontFamily: supportUI.fontNanum('r'),
  );
  late final TextStyle _connectionOKTestStyle = TextStyle(
      color: jakomoColor.white,
      fontFamily: supportUI.fontNanum('eb'),
      fontSize: supportUI.resFontSize(14),
      fontWeight: FontWeight.bold);
  final String _connectionSuccessText = '리클라이너와의 연결이 완료되었습니다.\n즐거운 휴식 되세요 :)';

  Future<void> showBLEConnectionSuccess(BuildContext context) async {
    final BLEController bleController = Get.find();
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            width: supportUI.deviceWidth,
            height: supportUI.resHeight(236),
            decoration: BoxDecoration(
              color: jakomoColor.white,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    '연결 완료',
                    style: _connectionTitleTextStyle,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: supportUI.resHeight(8),
                        bottom: supportUI.resHeight(24)),
                    child: Text(
                      _connectionSuccessText,
                      style: _connectionContentsTextStyle,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    bleController.isShowBottomSheet.value = true;
                    Get.back();
                  },
                  child: Container(
                    width: supportUI.deviceWidth * 5 / 6,
                    height: supportUI.resHeight(52),
                    decoration: BoxDecoration(
                        color: jakomoColor.pistachio,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(28))),
                    child: Center(
                      child: Text(
                        '확인',
                        style: _connectionOKTestStyle,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
        isScrollControlled: false,
        enableDrag: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(28))));
  }

  late final TextStyle _shakeGuideTitleTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: supportUI.fontNanum('eb'),
      fontSize: supportUI.resFontSize(24),
      color: jakomoColor.black);
  late final TextStyle _shakeGuideContentsTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontNanum('r'));
  final String _shakeGuideText =
      '흔들 모드를 실행하기 위해서는\n흔들 모드 자세로 변경됩니다.\n위험하니 도중에 움직이지 마세요.';

  Future<void> showShakeGuide(BuildContext context) async {
    final BLENavigationController bleNavigationController = Get.find();
    final BLEController bleController = Get.find();
    bool value = false;
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            width: supportUI.deviceWidth,
            height: supportUI.resHeight(263),
            decoration: BoxDecoration(
              color: jakomoColor.white,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    '안내',
                    style: _shakeGuideTitleTextStyle,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: supportUI.resHeight(8),
                        bottom: supportUI.resHeight(24)),
                    child: Text(
                      _shakeGuideText,
                      style: _shakeGuideContentsTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        value = false;
                        Get.back();
                      },
                      child: _concreteContainer('취소'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: supportUI.resWidth(8)),
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                          value = true;
                        },
                        child: _smallPistachioContainer('실행'),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
        isScrollControlled: false,
        enableDrag: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(28)))).whenComplete((){
              print('value : $value');
              if(value == true){
                bleNavigationController.shakeOn.value = true;
                bleController.controlDevice('shake', 2);
              }
    });
  }

  Widget _concreteContainer(String input) {
    return Container(
      width: supportUI.resWidth(148),
      height: supportUI.resHeight(52),
      decoration: BoxDecoration(
          color: jakomoColor.concrete,
          borderRadius: const BorderRadius.all(Radius.circular(28))),
      child: Center(
        child: Text(
          input,
          style: _concreteTextStyle,
        ),
      ),
    );
  }

  Widget _smallPistachioContainer(String input) {
    return Container(
      width: supportUI.resWidth(148),
      height: supportUI.resHeight(52),
      decoration: BoxDecoration(
          color: jakomoColor.pistachio,
          borderRadius: const BorderRadius.all(Radius.circular(28))),
      child: Center(
        child: Text(
          input,
          style: _smallPistachioTextStyle,
        ),
      ),
    );
  }

  Future<void> showLogOut(BuildContext context) async {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            width: supportUI.deviceWidth,
            height: supportUI.resHeight(213),
            decoration: BoxDecoration(
              color: jakomoColor.white,
              borderRadius:
              const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text('로그아웃 완료', style: _errorTitleTextStyle,),
                ),
                Padding(padding: EdgeInsets.only(top: supportUI.resHeight(8), bottom: supportUI.resHeight(24)),
                  child: Center(
                    child: Text('로그아웃이 정상적으로 완료되었습니다.',style: _errorContentsTextStyle,),
                  ),
                ),
                Center(
                  child: GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: Container(
                      width: supportUI.deviceWidth*5/6,
                      height: supportUI.resHeight(52),
                      decoration: BoxDecoration(
                          color: jakomoColor.pistachio,
                          borderRadius: const BorderRadius.all(Radius.circular(28)),
                          boxShadow: []
                      ),
                      child: Center(
                        child: Text('확인', style: _connectionOKTestStyle,),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
        isScrollControlled: false,
        enableDrag: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(28))));
  }
  Future<void> showWidthDrawal(BuildContext context) async {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            width: supportUI.deviceWidth,
            height: supportUI.resHeight(246),
            decoration: BoxDecoration(
              color: jakomoColor.white,
              borderRadius:
              const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text('회원탈퇴 완료', style: _errorTitleTextStyle,),
                ),
                Padding(padding: EdgeInsets.only(top: supportUI.resHeight(8), bottom: supportUI.resHeight(24)),
                  child: Center(
                    child: Text('회원탈퇴가 완료되었습니다 :)\n더 발전하는 자코모가 되겠습니다.',style: _errorContentsTextStyle,textAlign: TextAlign.center,),
                  ),
                ),
                Center(
                  child: GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: commonUI.pistachioBigButton('홈으로'),
                  ),
                )
              ],
            ),
          );
        },
        isScrollControlled: false,
        enableDrag: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(28))));
  }
   Future<void> showMeasureFail(BuildContext context) async {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            width: supportUI.deviceWidth,
            height: supportUI.resHeight(213),
            decoration: BoxDecoration(
              color: jakomoColor.white,
              borderRadius:
              const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text('측정 실패', style: _errorTitleTextStyle,),
                ),
                Padding(padding: EdgeInsets.only(top: supportUI.resHeight(8), bottom: supportUI.resHeight(24)),
                  child: Center(
                    child: Text('측정 중 오류가 발생했습니다.',style: _errorContentsTextStyle,),
                  ),
                ),
                Center(
                  child: GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: Container(
                      width: supportUI.deviceWidth*5/6,
                      height: supportUI.resHeight(52),
                      decoration: BoxDecoration(
                          color: jakomoColor.pistachio,
                          borderRadius: const BorderRadius.all(Radius.circular(28)),
                          boxShadow: []
                      ),
                      child: Center(
                        child: Text('확인', style: _connectionOKTestStyle,),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
        isScrollControlled: false,
        enableDrag: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(28))));
  }
  Future<void> showConnectionNeed(BuildContext context) async {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            width: supportUI.deviceWidth,
            height: supportUI.resHeight(200),
            decoration: BoxDecoration(
              color: jakomoColor.white,
              borderRadius:
              const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    '안내',
                    style: _shakeGuideTitleTextStyle,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: supportUI.resHeight(8),
                        bottom: supportUI.resHeight(24)),
                    child: Text(
                      '해당 기능은 블루투스 연결이 필요합니다.\n 블루투스를 연결하시겠습니까?',
                      style: _shakeGuideContentsTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: _concreteContainer('취소'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: supportUI.resWidth(8)),
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                          Get.toNamed(JakomoRoutes.connection);
                        },
                        child: _smallPistachioContainer('확인'),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
        isScrollControlled: false,
        enableDrag: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(28))));
  }
  late final TextStyle _guideBottomTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: supportUI.resFontSize(24),
      color: jakomoColor.black,
      fontFamily: supportUI.fontNanum('eb')
  );
  late final TextStyle _guideContentsTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontNanum('r'),
      height: 1.6
  );
  late final JakomoBottomSheet jakomoBottomSheet = JakomoBottomSheet(supportUI: supportUI, jakomoColor: jakomoColor);
  final String _guideContents = '측정이 완료될 때까지 취소가 어렵습니다.정확한 측정을 위해 리클라이너에 안전하게 착석해주시길 바랍니다.';
  Future<void> showMeasureGuide(BuildContext context) async{
    final BLEController bleController = Get.find();
    final MeasureProgressController measureProgressController = Get.find();
    showModalBottomSheet(context: context, builder: (BuildContext context){
      return Container(
        width: supportUI.deviceWidth,
        height: supportUI.deviceHeight*0.35,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          color: jakomoColor.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text('안내', style: _guideBottomTextStyle,),
            ),
            Center(
              child:  Padding(
                padding: EdgeInsets.only(top: supportUI.resHeight(5), bottom: supportUI.resHeight(24)),
                child: SizedBox(
                  width: supportUI.deviceWidth*3/4,
                  child: Text(_guideContents, textAlign: TextAlign.center, style: _guideContentsTextStyle, softWrap: true,),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child: commonUI.concreteButton('취소'),
                ),
                GestureDetector(
                  onTap: (){
                    Get.back();
                    bleController.measureStart();
                    Get.toNamed(JakomoRoutes.careProgress);
                    measureProgressController.progressValue.value = 0;
                    measureProgressController.startProgressTimer();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: supportUI.resWidth(8)),
                    child: commonUI.pistachioSmallButton('확인'),
                  ),
                )
              ],
            )
          ],
        ),
      );
    }, shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
    ), isDismissible: true, enableDrag: false);
  }
  late final TextStyle _pwdModifyContentsTextStyle = TextStyle(
      color: jakomoColor.boulder,
      height: 1.6,
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontNanum('r'));
  Future<void> showPwdModify(BuildContext context) async {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            width: supportUI.deviceWidth,
            height: supportUI.resHeight(246),
            decoration: BoxDecoration(
              color: jakomoColor.white,
              borderRadius:
              const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text('비밀번호 재설정 완료', style: _errorTitleTextStyle,),
                ),
                Padding(padding: EdgeInsets.only(top: supportUI.resHeight(8), bottom: supportUI.resHeight(24)),
                  child: Center(
                    child: Text('비밀번호가 변경되었습니다.\n로그인페이지로 이동합니다.',style: _pwdModifyContentsTextStyle,textAlign: TextAlign.center,),
                  ),
                ),
                Center(
                  child: GestureDetector(
                    onTap: (){
                      Get.back();
                      Get.toNamed(JakomoRoutes.login);
                    },
                    child: commonUI.pistachioBigButton('확인'),
                  ),
                )
              ],
            ),
          );
        },
        isScrollControlled: false,
        enableDrag: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(28))));
  }
}
