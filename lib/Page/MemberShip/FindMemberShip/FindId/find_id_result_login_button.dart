import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/MemberShip/FindMemberShip/find_membership_controller.dart';
import 'package:jakomo_recliner/Routes/jakomo_routes.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class FindIdResultLoginButton extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;
  FindIdResultLoginButton({Key? key, required this.supportUI, required this.jakomoColor, required this.commonUI}):super(key: key);
  late final TextStyle _guideTextStyle = TextStyle(
    fontFamily: supportUI.fontNanum('r'),
    fontSize: supportUI.resFontSize(12),
    color: jakomoColor.boulder,
  );
  late final TextStyle _pwdTextStyle = TextStyle(
      fontFamily: supportUI.fontNanum('b'),
      fontSize: supportUI.resFontSize(12),
      color: jakomoColor.mineShaft,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.underline);

  final FindMemberShipController findMemberShipController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(left: supportUI.commonLeft(), bottom: supportUI.resHeight(16.6)),
          child: _guideText(),
        ),
        GestureDetector(
          onTap: (){
            findMemberShipController.wichIdx.value = 2;
          },
          child: Padding(
            padding: EdgeInsets.only(left: supportUI.commonLeft(), bottom: supportUI.resHeight(20)),
            child: _pwd(),
          ),
        ),
        GestureDetector(
          onTap: () => Get.toNamed(JakomoRoutes.login),
          child: commonUI.pistachioRectangleButton('로그인'),
        )
      ],
    );
  }
  Widget _guideText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(right: supportUI.resWidth(6.5)),
              child: SizedBox(
                width: supportUI.resWidth(15),
                height: supportUI.resHeight(15),
                child: Image.asset('images/lined_info_icon.png'),
              ),
            ),
            Text(
              'SNS 계정은 아이디를 찾을 수 없습니다.',
              style: _guideTextStyle,
            )
          ],
        ),
        Align(
          alignment: AlignmentDirectional.topStart,
          child: Padding(
            padding: EdgeInsets.only(left: supportUI.resWidth(21.5)),
            child: Text(
              '고객센터에 문의 부탁드립니다.',
              style: _guideTextStyle,
            ),
          ),
        )
      ],
    );
  }

  Widget _pwd() {
    return Align(
      alignment: AlignmentDirectional.bottomStart,
      child: Text(
        '비밀번호 재설정하기',
        style: _pwdTextStyle,
      ),
    );
  }
}