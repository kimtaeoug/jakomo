import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:jakomo_recliner/Page/RestCarePage/RestCareAudioItem/rest_care_audio_model.dart';
import 'package:just_audio/just_audio.dart';

class RestCareAudioController extends GetxController{
  RxInt idx = 100.obs;
  RxBool isPlaying = false.obs;
  RxInt nowPosition = 0.obs;
  RxInt totalLength = 0.obs;
  RxString imgPath = 'images/audio_thumb_img.png'.obs;

  Rx<RestCareAudioModel> audioModel = RestCareAudioModel(
      title: '주말 오후 휴식 오디오',
      contents: '만천하의 싹이 심장의 약동하다. 어디 할지라도 때까지 몸이귀는 고동을 청춘의 그러므로 있을 말이다. 가진 낙원을 것은 군영과 피는 청춘은 같은 무엇을 운다.',
      img: 'images/audio_thumb_img.png',
      audio: 'audios/dontforget.mp3',
      type: 'nothing').obs;
}