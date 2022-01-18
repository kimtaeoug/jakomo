import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class IntroCircleFrame extends CustomClipper<Path> {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  IntroCircleFrame({required this.supportUI, required this.jakomoColor});
  @override
  Path getClip(Size size) {
    return Path()
      ..addOval(Rect.fromCircle(
          center:  Offset(size.width / 2, size.height / 2),
          radius: size.height * 0.465))
      ..addRect( Rect.fromLTWH(0.0, 0.0, size.width, size.height))
      ..fillType = PathFillType.evenOdd;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}