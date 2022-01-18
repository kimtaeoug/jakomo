import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/MyPage/mypage_contents.dart';
import 'package:jakomo_recliner/Page/MyPage/mypage_img.dart';
import 'package:jakomo_recliner/Routes/jakomo_routes.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class MyPageTop extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;
  const MyPageTop({
    Key? key,
    required this.supportUI,
    required this.jakomoColor,
    required this.commonUI
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: supportUI.resWidth(27), right: supportUI.resWidth(20), bottom: supportUI.resWidth(13)),
          child: Align(
            alignment: AlignmentDirectional.topEnd,
            child: GestureDetector(
              onTap: ()=>Get.toNamed(JakomoRoutes.setting),
              child: SizedBox(
                width: supportUI.resWidth(24),
                height: supportUI.resWidth(24),
                child: Image.asset('images/setting_icon.png'),
              ),
            ),
          ),
        ),
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: supportUI.resWidth(40)),
              child: Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: MyPageContents(supportUI: supportUI, jakomoColor: jakomoColor, commonUI: commonUI,),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: supportUI.commonLeft()),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: MyPageImg(supportUI: supportUI, jakomoColor: jakomoColor),
              ),
            ),
          ],
        )
      ],
    );
  }
}
