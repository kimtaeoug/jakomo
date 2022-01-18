import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/Page/RestCarePage/RestCareAudioItem/rest_care_audio_button.dart';
import 'package:jakomo_recliner/Page/RestCarePage/RestCareAudioItem/rest_care_audio_item_slider.dart';
import 'package:jakomo_recliner/Page/RestCarePage/RestCareAudioItem/rest_care_audio_model.dart';
import 'package:jakomo_recliner/Page/RestCarePage/RestCareAuido/rest_care_audio_factory.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class RestCareAudioItem extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final RestCareAudioFactory restCareAudioFactory;
  final RestCareAudioModel restCareAudioModel;

  RestCareAudioItem(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.restCareAudioFactory,
      required this.restCareAudioModel})
      : super(key: key);
  late final TextStyle _titleTextStyle = TextStyle(
      color: jakomoColor.woodSmoke,
      fontFamily: supportUI.fontNanum('eb'),
      fontWeight: FontWeight.w700,
      fontSize: supportUI.resFontSize(18));
  late final TextStyle _contentsTextStyle = TextStyle(
      color: jakomoColor.woodSmoke.withOpacity(0.6),
      height: 1.5,
      fontWeight: FontWeight.w400,
      fontFamily: supportUI.fontNanum('r'),
      fontSize: supportUI.resFontSize(12));

  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.deviceWidth,
      height: supportUI.resWidth(575),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          color: jakomoColor.white),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: supportUI.deviceWidth,
              height: supportUI.resWidth(56),
              decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20)),
                  color: jakomoColor.white),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: supportUI.resHeight(6)),
                  child: Container(
                    width: supportUI.resWidth(44),
                    height: supportUI.resWidth(6),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        color: jakomoColor.alto),
                  ),
                ),
              ),
            ),
            Container(
              width: supportUI.deviceWidth * 5 / 6,
              height: supportUI.deviceWidth * 5 / 6,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  image: DecorationImage(
                      image: AssetImage(restCareAudioModel.img),
                      fit: BoxFit.fill)),
              child: Center(
                child: RestCareAudioButton(
                    supportUI: supportUI,
                    jakomoColor: jakomoColor,
                    restCareAudioFactory: restCareAudioFactory),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: supportUI.resWidth(32), bottom: supportUI.resHeight(10)),
              child: SizedBox(
                width: supportUI.deviceWidth * 5 / 6,
                child: Text(
                  restCareAudioModel.title,
                  style: _titleTextStyle,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: supportUI.resWidth(30)),
              child: SizedBox(
                width: supportUI.deviceWidth * 5 / 6,
                child: Text(
                  restCareAudioModel.contents,
                  style: _contentsTextStyle,
                  textAlign: TextAlign.start,
                  maxLines: 3,
                ),
              ),
            ),
            RestCareAudioItemSlider(
                supportUI: supportUI,
                jakomoColor: jakomoColor,
                restCareAudioModel: restCareAudioModel,
                restCareAudioFactory: restCareAudioFactory,
            )
          ],
        ),
      ),
    );
  }
}
