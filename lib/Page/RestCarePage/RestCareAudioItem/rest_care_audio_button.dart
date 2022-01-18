import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/RestCarePage/RestCareAudioItem/rest_care_audio_model.dart';
import 'package:jakomo_recliner/Page/RestCarePage/RestCareAuido/rest_care_audio_controller.dart';
import 'package:jakomo_recliner/Page/RestCarePage/RestCareAuido/rest_care_audio_factory.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class RestCareAudioButton extends StatefulWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final RestCareAudioFactory restCareAudioFactory;

  const RestCareAudioButton(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.restCareAudioFactory})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _RestCareAudioButton();
}

class _RestCareAudioButton extends State<RestCareAudioButton> {
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  late final RestCareAudioFactory restCareAudioFactory =
      widget.restCareAudioFactory;

  final RestCareAudioController restCareAudioController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: (){
          if(restCareAudioController.isPlaying.value){
            restCareAudioFactory.pauseAudio();
          }else{
            restCareAudioFactory.playAudio();
          }
        },
        child: SizedBox(
          width: supportUI.resWidth(72),
          height: supportUI.resWidth(72),
          child: Image.asset(
            restCareAudioController.isPlaying.value
                ? 'images/pause_icon.png'
                : 'images/play_icon.png',
            fit: BoxFit.fitHeight,
          ),
        ),
      );
    });
  }
}
