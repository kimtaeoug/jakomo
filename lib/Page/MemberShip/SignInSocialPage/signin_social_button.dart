import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/MemberShip/SignInSocialPage/signin_social_controller.dart';
import 'package:jakomo_recliner/Routes/jakomo_routes.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class SigninSocialButton extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;

  SigninSocialButton(
      {Key? key,
        required this.supportUI,
        required this.jakomoColor,
        required this.commonUI})
      : super(key: key);
  final SignInSocialController signinController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: supportUI.resHeight(32), bottom: supportUI.resHeight(24)),
      child: GestureDetector(
        onTap: () {
          if(signinController.validateTotal()){
            Get.toNamed(JakomoRoutes.signinSuccess);
          }
        },
        child: commonUI.pistachioRectangleButton('가입하기'),
      ),
    );
  }
}