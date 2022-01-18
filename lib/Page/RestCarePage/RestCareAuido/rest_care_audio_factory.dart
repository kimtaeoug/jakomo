import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/RestCarePage/RestCareAuido/rest_care_audio_controller.dart';
import 'package:just_audio/just_audio.dart';

class RestCareAudioFactory{
  static final RestCareAudioFactory restCareAudioFactory = RestCareAudioFactory._init();
  RestCareAudioFactory._init();
  factory RestCareAudioFactory() => restCareAudioFactory;
  final AudioPlayer audioPlayer = AudioPlayer();
  final RestCareAudioController restCareAudioController = Get.find();
  void setAudioFile(String path, String imgPath) async{
    await audioPlayer.setAsset(path);
    restCareAudioController.imgPath.value = imgPath;
    if(audioPlayer.duration != null){
      restCareAudioController.totalLength.value = audioPlayer.duration!.inMilliseconds;
    }
    restCareAudioController.nowPosition.value = 0;
  }

  void playAudio()async {
    await audioPlayer.play();
  }
  // void resumeAudio()async{
  //   await audioPlayer.
  // }
  void pauseAudio()async{
    await audioPlayer.pause();
  }
  void stopAudio() async{
    await audioPlayer.stop();
    restCareAudioController.totalLength.value = 0;
    restCareAudioController.nowPosition.value = 0;
    restCareAudioController.idx.value = 100;
  }
  void seekAudio(double value)async{
    await audioPlayer.seek(Duration(milliseconds: value.toInt()));
    restCareAudioController.nowPosition.value = value.toInt();
  }
  void initObservingAudioPlayer(){
    observingAudioPlayerState();
    observingAudioPlayer();
  }
  void observingAudioPlayerState(){
    audioPlayer.playerStateStream.listen((state) {
      restCareAudioController.isPlaying.value = state.playing;
      if(state.processingState == ProcessingState.completed){
        restCareAudioController.isPlaying.value = false;
        restCareAudioController.idx.value = 100;
      }
    });
  }
  void observingAudioPlayer(){
    audioPlayer.positionStream.listen((position) {
      if(restCareAudioController.nowPosition.value < restCareAudioController.totalLength.value ){
        restCareAudioController.nowPosition.value = position.inMilliseconds;
      }
    });
  }
}