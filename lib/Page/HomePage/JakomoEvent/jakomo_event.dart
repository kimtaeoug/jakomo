import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/Page/HomePage/JakomoEvent/jakomo_event_item.dart';
import 'package:jakomo_recliner/Page/HomePage/JakomoEvent/jakomo_event_model.dart';
import 'package:jakomo_recliner/Page/HomePage/JakomoNews/jakomo_new_idx.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class JakomoEvent extends StatefulWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  JakomoEvent({Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);
  final List<JakomoEventModel> _eventList = [
    JakomoEventModel(
        eventImage: 'images/banner_img.png',
        eventContents: '1인 체어 구매시\n5,000원 할인',
        eventDate: '10/25~10/31'),
    JakomoEventModel(
        eventImage: 'images/banner_img.png',
        eventContents: '1인 체어 구매시\n5,000원 할인',
        eventDate: '10/25~10/231')
  ];

  @override
  State<StatefulWidget> createState() => _JakomoEvent();
}

class _JakomoEvent extends State<JakomoEvent> {
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  late final List<JakomoEventModel> _eventList = widget._eventList;
  final PageController _pageController = PageController(viewportFraction: 1, keepPage: true);
  int idx = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: jakomoColor.white,
      child: Padding(
        padding: EdgeInsets.only(
            top: supportUI.resHeight(50), bottom: supportUI.resWidth(60)),
        child: SizedBox(
          width: supportUI.deviceWidth,
          height: supportUI.resWidth(140),
          child: Stack(
            children: [
              SizedBox(
                width: supportUI.deviceWidth,
                height: supportUI.resWidth(140),
                child: PageView.builder(
                    controller: _pageController,
                    itemCount: _eventList.length,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (int page){
                      setState(() {
                        idx = page+1;
                      });
                    },
                    itemBuilder: (_, index){
                      return JakomoEventItem(supportUI: supportUI, jakomoColor: jakomoColor, jakomoEventModel: _eventList[index]);
                    }),
              ),

              SizedBox(
                width: supportUI.deviceWidth,
                height: supportUI.resWidth(140),
                child: Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: supportUI.resWidth(24),
                        bottom: supportUI.resWidth(15)),
                    child: JakomoNewsIdx(
                        supportUI: supportUI,
                        jakomoColor: jakomoColor,
                        idx: idx,
                        totalLength: _eventList.length),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
