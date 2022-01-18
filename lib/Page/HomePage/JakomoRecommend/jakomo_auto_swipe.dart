import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'jakomo_recommend_item.dart';
import 'jakomo_recommend_model.dart';

class JakomoAutoSwipe extends StatefulWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final List<JakomoRecommendModel> recommedList;
  const JakomoAutoSwipe(
      {Key? key, required this.supportUI, required this.jakomoColor, required this.recommedList})
      : super(key: key);

  @override
  State<StatefulWidget> createState()=> _JakomoAutoSwipe();
}
class _JakomoAutoSwipe extends State<JakomoAutoSwipe>{
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  late final List<JakomoRecommendModel> recommedList = widget.recommedList;
  late final PageController _controller;
  int pageIdx = 0;
  late Timer autoTimer;
  @override
  void initState() {
    super.initState();
    _controller =
        PageController(viewportFraction: 1, keepPage: true, initialPage: 0);
    if(mounted){
      Timer.periodic(const Duration(seconds: 3), (timer) {
        autoTimer = timer;
        if(_controller.hasClients){
          try{
            _controller.animateToPage(pageIdx, duration: const Duration(seconds: 1), curve: Curves.linear);
          }catch(e){
            timer.cancel();
          }
        }
        pageIdx += 1;
        if(pageIdx > 2){
          pageIdx = 0;
        }
      });
    }else{
      autoTimer.cancel();
    }
  }
  @override
  void dispose() {
    autoTimer.cancel();
    _controller.dispose();
    super.dispose();
  }
  late final TextStyle _newTextStyle = TextStyle(
      fontFamily: supportUI.fontPoppings('extrabold'),
      color: jakomoColor.white,
      fontSize: supportUI.resFontSize(14),
      fontWeight: FontWeight.w900);
  late final TextStyle _titleTextStyle =
  TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: supportUI.fontNanum('r'),
      color: jakomoColor.black, fontSize: supportUI.resFontSize(16));
  late final TextStyle _moveTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontFamily: supportUI.fontNanum('b'),
      fontSize: supportUI.resFontSize(14),
      decoration: TextDecoration.underline);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Center(
          child: SizedBox(
            height: supportUI.resWidth(390),
            child: PageView.builder(
                controller: _controller,
                itemCount: recommedList.length,
                scrollDirection: Axis.horizontal,
                onPageChanged: (int idx){
                  setState(() {
                    pageIdx = idx;
                  });
                },
                itemBuilder: (_, index) {
                  return JakomoRecommendItem(
                      supportUI: supportUI,
                      jakomoColor: jakomoColor,
                      jakomoRecommendModel: recommedList[0],
                      newTextStyle: _newTextStyle,
                      titleTextStyle: _titleTextStyle,
                      moveTextStyle: _moveTextStyle);
                }),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: supportUI.resWidth(27)),
          child: Center(
            child: SmoothPageIndicator(
              controller: _controller,
              count: recommedList.length,
              effect: ExpandingDotsEffect(
                  expansionFactor: 4,
                  dotWidth: supportUI.resWidth(4),
                  dotHeight: supportUI.resHeight(4),
                  dotColor: jakomoColor.silver,
                  activeDotColor: jakomoColor.pistachio,
                  paintStyle: PaintingStyle.fill
              ),
            ),
          ),
        )
      ],
    );
  }
}