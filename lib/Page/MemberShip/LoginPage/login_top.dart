import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class LoginTop extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  const LoginTop({Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: supportUI.resWidth(24),
              top: supportUI.resWidth(28),
              bottom: supportUI.resWidth(86)),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: SizedBox(
                width: supportUI.resWidth(9),
                height: supportUI.resWidth(15),
                child: Image.asset(
                  'images/back_icon.png',
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: supportUI.commonLeft(), bottom: supportUI.resWidth(39)),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: SizedBox(
              width: supportUI.resWidth(120),
              child: Image.asset(
                'images/logo_icon.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        )
      ],
    );
  }
}
