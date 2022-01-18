import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/RestCarePage/RestCareAudioItem/rest_care_audio_item.dart';
import 'package:jakomo_recliner/Page/RestCarePage/RestCareAuido/rest_care_audio_controller.dart';
import 'package:jakomo_recliner/Page/RestCarePage/RestCareAuido/rest_care_audio_factory.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

//playing_audio_icon

class JakomoMusicButton extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  JakomoMusicButton(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);
  final RestCareAudioController restCareAudioController = Get.find();
  final RestCareAudioFactory restCareAudioFactory = RestCareAudioFactory();

  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage('images/audio_thumb_img.png'), context);
    return Obx(() {
      return restCareAudioController.isPlaying.value
          ? SizedBox(
              width: supportUI.resWidth(60),
              height: supportUI.resWidth(60),
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional.bottomStart,
                    child: GestureDetector(
                      onTap: () => _bottomSheet(context),
                      child: SizedBox(
                        width: supportUI.resWidth(52),
                        height: supportUI.resWidth(52),
                        child: Stack(
                          children: [
                            SizedBox(
                              width: supportUI.resWidth(52),
                              height: supportUI.resWidth(52),
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                    restCareAudioController.imgPath.value),
                              ),
                            ),
                            SizedBox(
                              width: supportUI.resWidth(52),
                              height: supportUI.resWidth(52),
                              child: Center(
                                child: SizedBox(
                                  width: supportUI.resWidth(21),
                                  height: supportUI.resWidth(14),
                                  child: Image.asset(
                                    'images/playing_audio_icon.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: GestureDetector(
                      onTap: () => restCareAudioFactory.stopAudio(),
                      child: Container(
                        width: supportUI.resWidth(24),
                        height: supportUI.resWidth(24),
                        decoration: BoxDecoration(
                            color: jakomoColor.mineShaft,
                            shape: BoxShape.circle),
                        child: Center(
                          child: SizedBox(
                            width: supportUI.resWidth(14),
                            height: supportUI.resWidth(14),
                            child: Image.asset(
                              'images/close_icon.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          : Container();
    });
  }

  Future<void> _bottomSheet(BuildContext context) async {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Obx(() {
            return RestCareAudioItem(
                supportUI: supportUI,
                jakomoColor: jakomoColor,
                restCareAudioFactory: restCareAudioFactory,
                restCareAudioModel: restCareAudioController.audioModel.value);
          });
        },
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))));
  }
}
