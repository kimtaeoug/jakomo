import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_bottomsheet.dart';
import 'package:jakomo_recliner/Page/MemberShip/FindMemberShip/FindPwd/find_pwd_controller.dart';
import 'package:jakomo_recliner/Page/MemberShip/FindMemberShip/FindPwd/find_pwd_find_structure.dart';
import 'package:jakomo_recliner/Page/MemberShip/FindMemberShip/FindPwd/find_pwd_modify_structure.dart';
import 'package:jakomo_recliner/Page/MemberShip/FindMemberShip/FindPwd/find_pwd_timer_controller.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';
class FindPwd extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;

  FindPwd(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.commonUI})
      : super(key: key);
  final FindPwdController findPwdController = Get.find();
  final FindPwdTimerController findPwdTimerController =
      Get.find();
  late final JakomoBottomSheet jakomoBottomSheet =
      JakomoBottomSheet(supportUI: supportUI, jakomoColor: jakomoColor);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: supportUI.resHeight(430),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(() {
            return Padding(
              padding: EdgeInsets.only(top: supportUI.resHeight(30.5)),
              child: findPwdController.requestModifyResult.value
                  ? FindPwdModifyStructure(
                  supportUI: supportUI,
                  jakomoColor: jakomoColor,
                  commonUI: commonUI)
                  : FindPwdFindStructure(
                  supportUI: supportUI,
                  jakomoColor: jakomoColor,
                  commonUI: commonUI),
            );
          }),
          Padding(
            padding: EdgeInsets.only(bottom: supportUI.resHeight(24)),
            child: Obx(() {
              RxBool emailCondition = findPwdController.didInsertEmail;
              RxBool nameCondition = findPwdController.didInsertName;
              RxBool authCondition = findPwdController.didPhoneAuth;
              if (findPwdController.requestModifyResult.value) {
                if (findPwdController.pwd.value != '' &&
                    findPwdController.nowRequestModify.value == true) {
                  return GestureDetector(
                    onTap: () => jakomoBottomSheet.showPwdModify(context),
                    child: commonUI.pistachioRectangleButton('비밀번호 변경하기'),
                  );
                } else {
                  return commonUI.concreteRectangleButton('비밀번호 변경하기');
                }
              } else {
                if (emailCondition.value == true &&
                    nameCondition.value == true &&
                    authCondition.value == true) {
                  return GestureDetector(
                    onTap: () =>
                    findPwdController.requestModifyResult.value = true,
                    child: commonUI.pistachioRectangleButton('재설정 하기'),
                  );
                } else {
                  return commonUI.concreteRectangleButton('재설정 하기');
                }
              }
            }),
          )
        ],
      ),
    );
  }
}
