import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class JakomoRecommendImage extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final String img;
  final TextStyle newTextStyle;

  const JakomoRecommendImage(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.img,
      required this.newTextStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: supportUI.resWidth(260),
          height: supportUI.resWidth(260),
          child: Align(
            alignment: AlignmentDirectional.bottomStart,
            child: SizedBox(
              width: supportUI.resWidth(249),
              height: supportUI.resWidth(225),
              child: Align(
                alignment: AlignmentDirectional.topEnd,
                child: Transform.rotate(
                  angle: 40,
                  child: Container(
                    width: supportUI.resWidth(30),
                    height: supportUI.resWidth(20),
                    color: jakomoColor.trendyGreen,
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          width: supportUI.resWidth(260),
          height: supportUI.resWidth(260),
          decoration: BoxDecoration(
              color: jakomoColor.quarterSpanishWhite, shape: BoxShape.circle),
          child: Center(
            child: Image.asset(
              img,
              width: supportUI.resWidth(121),
              height: supportUI.resWidth(152),
            ),
          ),
        ),
        SizedBox(
          width: supportUI.resWidth(260),
          height: supportUI.resWidth(260),
          child: Align(
            alignment: AlignmentDirectional.bottomStart,
            child: SizedBox(
              width: supportUI.resWidth(255),
              height: supportUI.resWidth(248),
              child: Align(
                alignment: AlignmentDirectional.topEnd,
                child: Container(
                  width: supportUI.resWidth(62),
                  height: supportUI.resWidth(36),
                  decoration: BoxDecoration(
                      color: jakomoColor.pistachio,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30))),
                  child: Center(
                    child: Text(
                      'NEW',
                      style: newTextStyle,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: supportUI.resWidth(260),
          height: supportUI.resWidth(260),
          child: Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Padding(
              padding: EdgeInsets.only(right: supportUI.resWidth(18)),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: supportUI.resWidth(48),
                  height: supportUI.resWidth(48),
                  decoration: BoxDecoration(
                      borderRadius:
                      const BorderRadius.all(Radius.circular(15)),
                      color: jakomoColor.emperor),
                  child: Center(
                    child: Image.asset(
                      'images/more_arrow_icon.png',
                      width: supportUI.resWidth(20),
                      height: supportUI.resWidth(20),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
