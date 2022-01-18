import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/Page/HomePage/JakomoCustomCare/jakomo_custom_care_model.dart';
import 'package:jakomo_recliner/Page/RestCarePage/RestGuideItem/rest_guide_title_tag.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class RestGuideTitle extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final JakomoCustomCareModel jakomoCustomCareModel;

  RestGuideTitle(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.jakomoCustomCareModel})
      : super(key: key);
  late final TextStyle _titleTextStyle = TextStyle(
      color: jakomoColor.white,
      fontFamily: supportUI.fontNanum('eb'),
      fontSize: supportUI.resFontSize(21),
      fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: supportUI.resWidth(30)),
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: SizedBox(
              width: supportUI.getTextSize(jakomoCustomCareModel.title, _titleTextStyle).width / 2,
              child: Text(
                jakomoCustomCareModel.title,
                style: _titleTextStyle,
                maxLines: 2,
                softWrap: true,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: supportUI.resWidth(15), bottom: supportUI.resWidth(28), left: supportUI.resWidth(30)),
          child: SizedBox(
            width: supportUI.deviceWidth,
            height: supportUI.resWidth(28),
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: jakomoCustomCareModel.tagList.length,
                itemBuilder: (context, idx){
                  return Padding(
                    padding: EdgeInsets.only(right: supportUI.resWidth(4)),
                    child: RestGuideTitleTag(
                        supportUI: supportUI,
                        jakomoColor: jakomoColor,
                        tag: jakomoCustomCareModel.tagList[idx]),
                  );
                }),
          ),
        )
      ],
    );
  }

}
