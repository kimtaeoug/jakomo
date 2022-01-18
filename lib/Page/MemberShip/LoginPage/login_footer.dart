import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/MemberShip/FindMemberShip/find_membership_controller.dart';
import 'package:jakomo_recliner/Routes/jakomo_routes.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class LoginFooter extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  LoginFooter({Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);
  late final TextStyle _textStyle = TextStyle(
    color: jakomoColor.boulder,
    fontSize: supportUI.resFontSize(13),
    fontFamily: supportUI.fontNanum('r')
  );
  final FindMemberShipController findMemberShipController = Get.put(FindMemberShipController());

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(bottom: supportUI.resWidth(22)), child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: (){
            findMemberShipController.wichIdx.value = 1;
            Get.toNamed(JakomoRoutes.find);
          },
          child: Text('아이디 찾기', style: _textStyle,),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: supportUI.resWidth(13.5),
              right: supportUI.resWidth(11)
          ),
          child: Container(
            width: supportUI.resWidth(1),
            height: supportUI.resWidth(13),
            color: jakomoColor.mercury,
          ),
        ),
        GestureDetector(
          onTap: (){
            findMemberShipController.wichIdx.value = 2;
            Get.toNamed(JakomoRoutes.find);
          },
          child:  Text('비밀번호 찾기', style: _textStyle,),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: supportUI.resWidth(13.5),
              right: supportUI.resWidth(11)
          ),
          child: Container(
            width: supportUI.resWidth(1),
            height: supportUI.resWidth(13),
            color: jakomoColor.mercury,
          ),
        ),
        GestureDetector(
          onTap: (){
            Get.toNamed(JakomoRoutes.signIn);
          },
          child: Text('회원가입', style: _textStyle,),
        )
      ],
    ),);
  }
}