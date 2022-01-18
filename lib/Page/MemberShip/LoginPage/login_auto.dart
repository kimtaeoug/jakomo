import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'login_controller.dart';

class LoginAuto extends StatefulWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  const LoginAuto(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginAuto();
}

class _LoginAuto extends State<LoginAuto> {
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;

  late final TextStyle _textStyle = TextStyle(
      color: jakomoColor.boulder,
      fontSize: supportUI.resFontSize(12),
      fontFamily: supportUI.fontNanum('r'));

  bool _clicked = false;
  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: supportUI.commonLeft(),
          bottom: supportUI.resWidth(18)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: (){
              setState(() {
                _clicked = !_clicked;
              });
              loginController.auto.value = _clicked;
            },
            child: SizedBox(
              width: supportUI.resWidth(18),
              height: supportUI.resWidth(18),
              child: Image.asset(_clicked?'images/selected_checkbox.png':'images/unselected_checkbox.png'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: supportUI.resWidth(8)),
            child: SizedBox(
              height: supportUI.resWidth(18),
              child: Center(
                child: Text('로그인 상태 유지', style: _textStyle,),
              ),
            ),
          )
        ],
      ),
    );
  }
}
