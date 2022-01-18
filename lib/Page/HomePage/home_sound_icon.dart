import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/RestCarePage/RestCareAuido/rest_care_audio_controller.dart';
import 'package:jakomo_recliner/Page/RestCarePage/RestCareAuido/rest_care_audio_factory.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class HomeSoundIcon extends StatefulWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  const HomeSoundIcon(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeSoundIcon();
}

class _HomeSoundIcon extends State<HomeSoundIcon> {
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  final RestCareAudioController restCareAudioController = Get.find();
  final RestCareAudioFactory restCareAudioFactory = RestCareAudioFactory();
  bool sound = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (sound) {
          restCareAudioFactory.pauseAudio();
        } else {
          restCareAudioFactory.playAudio();
        }
        setState(() {
          sound = !sound;
        });
      },
      child: Container(
        width: supportUI.resWidth(40),
        height: supportUI.resHeight(40),
        decoration:
            BoxDecoration(color: jakomoColor.white, shape: BoxShape.circle),
        child: Center(
          //mute_icon
          child: Image.asset(
            sound ? 'images/sound_icon.png' : 'images/mute_icon.png',
            width: supportUI.resWidth(18),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
