import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/Page/HomePage/JakomoEvent/jakomo_event_model.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class JakomoEventItem extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final JakomoEventModel jakomoEventModel;
  JakomoEventItem(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.jakomoEventModel
      })
      : super(key: key);
  late final TextStyle _eventTitleTextStyle =
      TextStyle(
          fontWeight: FontWeight.w900,
          fontFamily: supportUI.fontNanum('eb'),
          color: jakomoColor.black,
          fontSize: supportUI.resFontSize(18),
        height: 1.2
      );
  late final TextStyle _eventDateTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontSize: supportUI.resFontSize(12),
      fontFamily: supportUI.fontPoppings('semibold'),
      fontWeight: FontWeight.bold
  );
  late final TextStyle _evnetTextStyle =
      TextStyle(color: jakomoColor.white,
          fontFamily: supportUI.fontPoppings('semibold'),
          fontWeight: FontWeight.bold,
          fontSize: supportUI.resFontSize(10));

  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.deviceWidth,
      height: supportUI.resWidth(140),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                jakomoEventModel.eventImage,
              ),
              fit: BoxFit.fill)),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: SizedBox(
          width: supportUI.deviceWidth / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Padding(
                  padding: EdgeInsets.only(left: supportUI.resWidth(30)),
                  child: Container(
                    width: supportUI.resWidth(42),
                    height: supportUI.resWidth(16),
                    decoration: BoxDecoration(
                        color: jakomoColor.pistachio,
                        borderRadius:
                        const BorderRadius.all(Radius.circular(3))),
                    child: Center(
                      child: Text(
                        'EVENT',
                        style: _evnetTextStyle,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: supportUI.resWidth(30),
                    top: supportUI.resWidth(5),
                    bottom: supportUI.resWidth(10)),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    jakomoEventModel.eventContents,
                    style: _eventTitleTextStyle,
                    softWrap: true,
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: supportUI.resWidth(30)),
                child: Align(
                  alignment: AlignmentDirectional.bottomStart,
                  child: Text(
                    jakomoEventModel.eventDate,
                    style: _eventDateTextStyle,
                    textAlign: TextAlign.start,
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
