import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/Page/HomePage/JakomoNews/jakomo_news_item.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'jakomo_news_model.dart';

class JakomoNews extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  JakomoNews({Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);
  late final TextStyle _titleTextStyle = TextStyle(
      color: jakomoColor.black,
      fontFamily: supportUI.fontNanum('eb'),
      fontSize: supportUI.resFontSize(21),
      fontWeight: FontWeight.bold);
  late final TextStyle _titleEnTextStyle = TextStyle(
      color: jakomoColor.black,
      fontFamily: supportUI.fontPoppings('semibold'),
      fontSize: supportUI.resFontSize(21),
      fontWeight: FontWeight.bold);
  final List<JakomoNewsModel> _newsList = [
    JakomoNewsModel(
        newsImage: 'images/news_img.png',
        newsTitle: '굿바이2021 이벤트',
        newsContents: '달콤한 낮잠으로 오후의 활력을 얻으세요.',
        newsDate: '10/25~10/31'),
    JakomoNewsModel(
        newsImage: 'images/news_img.png',
        newsTitle: '굿바이2021 이벤트',
        newsContents: '달콤한 낮잠으로 오후의 활력을 얻으세요.',
        newsDate: '10/25~10/31'),
    JakomoNewsModel(
        newsImage: 'images/news_img.png',
        newsTitle: '굿바이2021 이벤트',
        newsContents: '달콤한 낮잠으로 오후의 활력을 얻으세요.',
        newsDate: '10/25~10/31')
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.deviceWidth,
      height: supportUI.resWidth(315),
      decoration: BoxDecoration(
        color: jakomoColor.white,
        border: Border.all(color: jakomoColor.white, width: 0)
      ),
      child: Padding(
        padding: EdgeInsets.only(left: supportUI.commonLeft()),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: supportUI.deviceWidth*11/12,
                height: supportUI.resWidth(30),
                child: Text.rich(
                    TextSpan(
                        children: [
                          TextSpan(
                            text: '자코모', style: _titleTextStyle,
                          ),
                          TextSpan(
                              text: ' NEWS', style: _titleEnTextStyle
                          )
                        ]
                    )
                ),
              ),
              SizedBox(
                width: supportUI.deviceWidth*11/12,
                height: supportUI.resWidth(263),
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: _newsList.length,
                    itemBuilder: (context, idx){
                      return JakomoNewsItem(supportUI: supportUI, jakomoColor: jakomoColor, jakomoNewsModel: _newsList[idx]);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
