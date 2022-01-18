import 'package:flutter/material.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class MeasureJumpingDot extends StatefulWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final int numberOfDots;

  const MeasureJumpingDot(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.numberOfDots})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _MeasureJumpingDot();
}

class _MeasureJumpingDot extends State<MeasureJumpingDot>
    with TickerProviderStateMixin {
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  late final int numberOfDots = widget.numberOfDots;
  late List<AnimationController> _animationControllers;
  List<Animation<double>> _animations = [];
  int animationDuration = 250;

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  @override
  void dispose() {
    if (_animationControllers.isNotEmpty) {
      for (AnimationController controller in _animationControllers) {
        controller.dispose();
      }
    }
    super.dispose();
  }

  // late Color dotColor = jakomoColor.alto;
  late List<Color> _colorList = List.generate(numberOfDots, (index) => jakomoColor.alto);
  late final List<Widget> _dotList = List.generate(numberOfDots, (index) => _dot(index));
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          numberOfDots,
          (index) => AnimatedBuilder(
              animation: _animationControllers[index],
              child: _dot(index),
              builder: (BuildContext context, Widget? _child) {
                return Container(
                  padding: const EdgeInsets.all(2.5),
                  child: Transform.translate(
                    offset: Offset(0, _animations[index].value),
                    child: _child,
                  ),
                );
              })),
    );
  }

  void _initAnimation() {
    _animationControllers = List.generate(
        numberOfDots,
        (index) => AnimationController(
            vsync: this, duration: Duration(milliseconds: animationDuration)));
    for (int i = 0; i < numberOfDots; i++) {
      _animations.add(
          Tween<double>(begin: 0, end: -10).animate(_animationControllers[i]));
    }
    for (int i = 0; i < numberOfDots; i++) {
      _animationControllers[i].addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationControllers[i].reverse().whenComplete((){
            setState(() {
              _colorList[i] = jakomoColor.alto;
            });
          });
          if (i != numberOfDots - 1) {
            _animationControllers[i + 1].forward();
          }
        }
        if(status == AnimationStatus.forward){
          setState(() {
            _colorList[i] = jakomoColor.emperor;
           });
        }
        if (i == numberOfDots - 1 && status == AnimationStatus.dismissed) {
          _animationControllers[0].forward();
        }
      });
    }
    _animationControllers.first.forward();
  }

  Widget _dot(int index) {
    return Container(
      width: supportUI.resWidth(6),
      height: supportUI.resHeight(6),
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: _colorList[index]),
    );
  }
}
