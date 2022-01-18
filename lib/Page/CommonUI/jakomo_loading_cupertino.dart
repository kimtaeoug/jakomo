import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_loading_cupertino_painter.dart';

class JakomoLoadingCupertino extends StatefulWidget{
  final bool animating;
  final double radius;
  final int tickCount;
  final Color activeColor;
  final Color inactiveColor;
  final Duration animationDuration;
  final double relativeWidth;
  final double startRatio;
  final double endRatio;
  const JakomoLoadingCupertino({Key? key,
    required this.animating,
    required this.radius,
    required this.tickCount,
    required this.activeColor,
    required this.inactiveColor,
    required this.animationDuration,
    required this.relativeWidth,
    required this.startRatio,
    required this.endRatio
  }):super(key: key);
  @override
  State<StatefulWidget> createState() => _JakomoLoadingCupertino();
}
class _JakomoLoadingCupertino extends State<JakomoLoadingCupertino> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    if (widget.animating) {
      _animationController.repeat();
    }
  }
  @override
  void didUpdateWidget(JakomoLoadingCupertino oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animating != oldWidget.animating) {
      if (widget.animating) {
        _animationController.repeat();
      } else {
        _animationController.stop();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.radius * 2,
      width: widget.radius * 2,
      child: CustomPaint(
        painter: JakomoLoadingCupertinoPainter(
          animationController: _animationController,
          radius: widget.radius,
          tickCount: widget.tickCount,
          activeColor: widget.activeColor,
          inactiveColor: widget.inactiveColor,
          relativeWidth: widget.relativeWidth,
          startRatio: widget.startRatio,
          endRatio: widget.endRatio,
        ),
      ),
    );
  }
}


