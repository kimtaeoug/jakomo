import 'dart:math';

import 'package:flutter/material.dart';

class RestCareSliverHeaderDelegates extends SliverPersistentHeaderDelegate {
  final double minHeight, maxHeight;
  final Widget minChild, maxChild;

  RestCareSliverHeaderDelegates(
      {required this.minHeight, required this.maxHeight, required this.minChild, required this.maxChild});

  late double visivleMainHeight, animationVal, width;

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    width = MediaQuery
        .of(context)
        .size
        .width;
    visivleMainHeight = max(maxExtent - shrinkOffset, minExtent);
    animationVal = scrollAnimationValue(shrinkOffset);
    return Container(
      height: visivleMainHeight,
      width: width,
      color: Colors.white,
      child: Stack(
        children: [
          minTop(),
          animationVal != 0? maxTop():Container()
        ],
      ),
    );
  }

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;

  double scrollAnimationValue(double shrinkOffset) {
    double maxScrollAllowed = maxExtent - minExtent;
    return ((maxScrollAllowed - shrinkOffset) / maxScrollAllowed)
        .clamp(0, 1)
        .toDouble();
  }
  Widget maxTop(){
    return Positioned(
        bottom: 0.0,
        child: Opacity(
          opacity: animationVal,
          child: SizedBox(
            height: maxHeight,
            width: width,
            child: maxChild,
          ),
        ));
  }
  Widget minTop(){
    return Opacity(
      opacity: 1 - animationVal,
      child: Container(
        height: visivleMainHeight,
        width: width,
        child: minChild,
      ),
    );
  }
}