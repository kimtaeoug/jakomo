import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/Page/HomePage/JakomoNews/jakomo_news_model.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class JakomoNewsItem extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final JakomoNewsModel jakomoNewsModel;

  JakomoNewsItem(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.jakomoNewsModel})
      : super(key: key);
  late final TextStyle _newsTitleTextStyle =
      TextStyle(
        fontWeight: FontWeight.w500,
          fontFamily: supportUI.fontNanum('b'),
          color: jakomoColor.black, 
          fontSize: supportUI.resFontSize(16));
  late final TextStyle _newsContentsTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontNanum('r'),
      fontWeight: FontWeight.w200
  );
  late final TextStyle _dateTextStyle = TextStyle(
      color: jakomoColor.pistachio,
      fontSize: supportUI.resFontSize(13),
      fontFamily: supportUI.fontPoppings('semibold'),
      fontWeight: FontWeight.w700
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: supportUI.resWidth(15)),
      child: SizedBox(
        width: supportUI.deviceWidth*5/6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: supportUI.deviceWidth*5/6,
              height: supportUI.resWidth(156),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  image: DecorationImage(
                      image: AssetImage(jakomoNewsModel.newsImage),fit: BoxFit.fill)),
            ),
            Padding(
              padding: EdgeInsets.only(top: supportUI.resHeight(22), bottom: supportUI.resHeight(16)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: supportUI.resWidth(7)),
                    child: SizedBox(
                      width: supportUI.deviceWidth*5/6,
                      child: Text(
                        jakomoNewsModel.newsTitle,
                        style: _newsTitleTextStyle,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: supportUI.deviceWidth*5/6,
                    height: supportUI.getTextSize(jakomoNewsModel.newsContents, _newsContentsTextStyle).height,
                    child: Text(
                      jakomoNewsModel.newsContents,
                      style: _newsContentsTextStyle,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: supportUI.deviceWidth*5/6,
              height: supportUI.resWidth(20),
              child: Text(
                jakomoNewsModel.newsDate,
                style: _dateTextStyle,
                textAlign: TextAlign.start,
              ),
            )
          ],
        ),
      ),
    );
  }
}
