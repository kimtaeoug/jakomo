import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/Page/MemberShip/SignInSocialPage/signin_social_controller.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class SignInSocialName extends StatefulWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;
  final TextStyle valueTextStyle;
  const SignInSocialName(
      {Key? key,
        required this.supportUI,
        required this.jakomoColor,
        required this.commonUI,
        required this.valueTextStyle
      })
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignInSocialName();
}
class _SignInSocialName extends State<SignInSocialName> {
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  late final CommonUI commonUI = widget.commonUI;
  late final TextStyle valueTextStyle = widget.valueTextStyle;

  final SignInSocialController signinController = Get.find();
  final GlobalKey<FormState> _nameKey = GlobalKey<FormState>();
  bool _isClicked = false;
  late final TextStyle _hintTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontNanum('r'));
  @override
  Widget build(BuildContext context) {
    signinController.setNameKey(_nameKey);
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: supportUI.resHeight(12)),
          child: Center(
            child: Obx((){
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  commonUI.textForm(
                      Color(signinController.nameColor.value),
                      Form(
                        key: _nameKey,
                        child: TextFormField(
                          onTap: () {
                            setState(() {
                              _isClicked = true;
                            });
                          },
                          onChanged: (String? value){
                            signinController.validateName(value);
                          },
                          keyboardType: TextInputType.name,
                          cursorColor: jakomoColor.silver,
                          style: valueTextStyle,
                          decoration: InputDecoration(
                            labelText: '이름',
                            labelStyle: TextStyle(
                                color: Color(signinController.nameLabelColor.value),
                                fontSize: supportUI.resFontSize(14),
                                fontFamily: supportUI.fontNanum('r')),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      )),
                  signinController.nameError.value != ''
                      ? commonUI.errorGuide(signinController.nameError.value)
                      : Container()
                ],
              );
            }),
          ),
        ),
        !_isClicked
            ? Padding(
          padding: EdgeInsets.only(bottom: supportUI.resHeight(12)),
          child: commonUI.signinDot('이름'),
        )
            : Container()
      ],
    );
  }
}