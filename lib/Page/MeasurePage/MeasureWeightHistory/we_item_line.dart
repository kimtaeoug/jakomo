import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class WEItemLine extends CustomPainter{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final double width1;
  final double height1;
  final double width2;
  final double height2;
  //iron
  WEItemLine({
    required this.supportUI,
    required this.jakomoColor,
    required this.width1,
    required this.height1,
    required this.width2,
    required this.height2});
  @override
  void paint(Canvas canvas, Size size) {
    final Offset p1 = Offset(width1, height1);
    final Offset p2 = Offset(width2, height2);
    final Paint paint = Paint()
        ..color = jakomoColor.black
        ..strokeWidth = supportUI.resWidth(2);
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}