import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/RestCarePage/RestCareAudioItem/rest_care_audio_model.dart';
import 'package:jakomo_recliner/Page/RestCarePage/RestCareAuido/rest_care_audio_controller.dart';
import 'package:jakomo_recliner/Page/RestCarePage/RestCareAuido/rest_care_audio_factory.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class RestCareAudioItemSlider extends StatefulWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final RestCareAudioModel restCareAudioModel;
  final RestCareAudioFactory restCareAudioFactory;

  RestCareAudioItemSlider(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.restCareAudioModel,
      required this.restCareAudioFactory})
      : super(key: key);
  late final TextStyle _timeTextStyle = TextStyle(
      color: jakomoColor.boulder, fontSize: supportUI.resFontSize(12), fontFamily: supportUI.fontNanum('r'));

  @override
  State<StatefulWidget> createState() => _RestCareAudioItemSlider();
}

class _RestCareAudioItemSlider extends State<RestCareAudioItemSlider> {
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  late final RestCareAudioModel restCareAudioModel = widget.restCareAudioModel;
  late final TextStyle _timeTextStyle = widget._timeTextStyle;
  late final RestCareAudioFactory restCareAudioFactory =
      widget.restCareAudioFactory;
  final RestCareAudioController restCareAudioController = Get.find();
  double currentValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: supportUI.deviceWidth * 5 / 6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: supportUI.deviceWidth * 5 / 6,
            height: supportUI.resHeight(4),
            child: SliderTheme(
                data: _jakomoSliderThemeData,
                child: Obx(() {
                  return Slider(
                    min: 0,
                    max: restCareAudioController.totalLength.value.toDouble(),
                    value: restCareAudioController.nowPosition.value.toDouble(),
                    onChanged: (double value) {
                      restCareAudioController.nowPosition.value = value.toInt();
                    },
                    onChangeEnd: (double value){
                      restCareAudioFactory.seekAudio(value);
                    },
                  );
                })),
          ),
          Padding(
            padding: EdgeInsets.only(top: supportUI.resHeight(8)),
            child: SizedBox(
              width: supportUI.deviceWidth * 5 / 6,
              child: Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      converToTime(restCareAudioController.nowPosition.value),
                      style: _timeTextStyle,
                    ),
                    Text(
                      converToTime(restCareAudioController.totalLength.value),
                      style: _timeTextStyle,
                    )
                  ],
                );
              }),
            ),
          )
        ],
      ),
    );
  }

  String converToTime(int input) {
    return '${twoDigits(Duration(milliseconds: input).inMinutes.remainder(60))}:${twoDigits(Duration(milliseconds: input).inSeconds.remainder(60))}';
  }

  String twoDigits(int n) => n >= 10 ? '$n' : '0$n';

  late final SliderThemeData _jakomoSliderThemeData = SliderThemeData(
      overlayColor: jakomoColor.transperent,
      overlayShape: const RoundSliderThumbShape(enabledThumbRadius: 0),
      inactiveTickMarkColor: jakomoColor.gallery,
      inactiveTrackColor: jakomoColor.gallery,
      activeTrackColor: jakomoColor.pistachio,
      activeTickMarkColor: jakomoColor.pistachio,
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0),
      disabledActiveTrackColor: jakomoColor.pistachio,
      disabledInactiveTrackColor: jakomoColor.gallery);
}
