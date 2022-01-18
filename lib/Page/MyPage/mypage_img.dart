import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class MyPageImg extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  const MyPageImg({
    Key? key,
    required this.supportUI,
    required this.jakomoColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.resWidth(80),
      height: supportUI.resWidth(80),
      decoration: BoxDecoration(
        color: jakomoColor.silver,
        borderRadius: const BorderRadius.all(Radius.circular(35))
      ),
      child: Center(
        child: SizedBox(
          width: supportUI.resWidth(28),
          height: supportUI.resWidth(28),
          child: Image.asset('images/inactivate_mypage_icon.png'),
        ),
      ),
    );
  }
}
