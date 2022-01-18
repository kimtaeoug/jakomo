import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/Page/RestCarePage/RestCareAudioItem/rest_care_audio_model.dart';
import 'package:jakomo_recliner/Page/RestCarePage/RestCareAudioItem/rest_care_audio_small_item.dart';
import 'package:jakomo_recliner/Page/RestCarePage/RestCareAuido/rest_care_audio_factory.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class RestCareAudio extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  RestCareAudio({Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);
  late final TextStyle _titleTextStyle = TextStyle(
    color: jakomoColor.boulder,
    fontFamily: supportUI.fontNanum('r'),
    fontSize: supportUI.resFontSize(12),
  );
  final List<RestCareAudioModel> _audioList = [
    RestCareAudioModel(
        title: '주말 오후 휴식 오디오',
        contents: '만천하의 싹이 심장의 약동하다. 어디 할지라도 때까지 몸이귀는 고동을 청춘의 그러므로 있을 말이다. 가진 낙원을 것은 군영과 피는 청춘은 같은 무엇을 운다.',
        img: 'images/audio_thumb_img.png',
        audio: 'audios/dontforget.mp3',
        type: 'new'),
    RestCareAudioModel(
        title: '주말 오후 휴식 오디오',
        contents: '만천하의 싹이 심장의 약동하다. 어디 할지라도 때까지 몸이귀는 고동을 청춘의 그러므로 있을 말이다. 가진 낙원을 것은 군영과 피는 청춘은 같은 무엇을 운다.',
        img: 'images/audio_thumb_img.png',
        audio: 'audios/dontforget.mp3',
        type: 'nothing'),
    RestCareAudioModel(
        title: '주말 오후 휴식 오디오',
        contents: '만천하의 싹이 심장의 약동하다. 어디 할지라도 때까지 몸이귀는 고동을 청춘의 그러므로 있을 말이다. 가진 낙원을 것은 군영과 피는 청춘은 같은 무엇을 운다.',
        img: 'images/audio_thumb_img.png',
        audio: 'audios/dontforget.mp3',
        type: 'new'),
    RestCareAudioModel(
        title: '주말 오후 휴식 오디오',
        contents: '만천하의 싹이 심장의 약동하다. 어디 할지라도 때까지 몸이귀는 고동을 청춘의 그러므로 있을 말이다. 가진 낙원을 것은 군영과 피는 청춘은 같은 무엇을 운다.',
        img: 'images/audio_thumb_img.png',
        audio: 'audios/dontforget.mp3',
        type: 'hot'),
    RestCareAudioModel(
        title: '주말 오후 휴식 오디오',
        contents: '만천하의 싹이 심장의 약동하다. 어디 할지라도 때까지 몸이귀는 고동을 청춘의 그러므로 있을 말이다. 가진 낙원을 것은 군영과 피는 청춘은 같은 무엇을 운다.',
        img: 'images/audio_thumb_img.png',
        audio: 'audios/dontforget.mp3',
        type: 'nothing')
  ];
  final RestCareAudioFactory restCareAudioFactory = RestCareAudioFactory();
  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage('images/audio_thumb_img.png'), context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: supportUI.commonLeft(),
              bottom: supportUI.resWidth(40),
              top: supportUI.resHeight(17.5)),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              '자코모가 추천해드리는 휴식 오디오',
              style: _titleTextStyle,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: supportUI.resWidth(160)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
                _audioList.length,
                (index) => Padding(
                  padding: EdgeInsets.only(bottom: supportUI.resWidth(20)),
                  child: RestCareAudioSmallItem(
                      supportUI: supportUI,
                      jakomoColor: jakomoColor,
                      idx: index,
                      restCareAudioFactory: restCareAudioFactory,
                      restCareAudioModel: _audioList[index]),
                )),
          ),
        )
      ],
    );
  }
}
