import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/RestCarePage/RestCareAudioItem/rest_care_audio_item.dart';
import 'package:jakomo_recliner/Page/RestCarePage/RestCareAudioItem/rest_care_audio_model.dart';
import 'package:jakomo_recliner/Page/RestCarePage/RestCareAuido/rest_care_audio_controller.dart';
import 'package:jakomo_recliner/Page/RestCarePage/RestCareAuido/rest_care_audio_factory.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class RestCareAudioSmallItem extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final int idx;
  final RestCareAudioFactory restCareAudioFactory;
  final RestCareAudioModel restCareAudioModel;

  RestCareAudioSmallItem(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.idx,
      required this.restCareAudioFactory,
      required this.restCareAudioModel})
      : super(key: key);
  late final TextStyle _titleTextStyle = TextStyle(
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontNanum('eb'),
      color: jakomoColor.woodSmoke,
      fontWeight: FontWeight.w800);
  late final TextStyle _contentsTextStyle = TextStyle(
      color: jakomoColor.woodSmoke.withOpacity(0.6),
      fontFamily: supportUI.fontNanum('r'),
      fontSize: supportUI.resFontSize(12));

  final RestCareAudioController restCareAudioController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return GestureDetector(
        onTap: () {
          if (restCareAudioController.idx.value != idx) {
            restCareAudioController.idx.value = idx;
            restCareAudioFactory.setAudioFile(
                restCareAudioModel.audio, restCareAudioModel.img);
            restCareAudioController.audioModel.value = restCareAudioModel;
            restCareAudioFactory.playAudio();
          }
          _bottomSheet(context);
        },
        child:SizedBox(
          width: supportUI.deviceWidth * 5 / 6,
          height: supportUI.resWidth(120),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Container(
                  width: supportUI.deviceWidth * 5 / 6,
                  height: supportUI.resWidth(112),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: restCareAudioController.idx.value == idx
                              ? jakomoColor.pistachio
                              : jakomoColor.boulder.withOpacity(0.2)),
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      color: restCareAudioController.idx.value == idx
                          ? jakomoColor.pistachio.withOpacity(0.1)
                          : jakomoColor.white),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:
                          EdgeInsets.only(left: supportUI.resWidth(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: supportUI.resWidth(5)),
                                child: SizedBox(
                                  width: supportUI.resWidth(158),
                                  child: Text(
                                    restCareAudioModel.title,
                                    style: _titleTextStyle,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: supportUI.resWidth(158),
                                child: Text(
                                  restCareAudioModel.contents,
                                  style: _contentsTextStyle,
                                  textAlign: TextAlign.start,
                                  maxLines: 2,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.only(right: supportUI.resWidth(20)),
                          child: SizedBox(
                            width: supportUI.resWidth(64),
                            height: supportUI.resWidth(64),
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: supportUI.resWidth(64),
                                  height: supportUI.resWidth(64),
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(
                                      restCareAudioModel.img,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: supportUI.resWidth(64),
                                  height: supportUI.resWidth(64),
                                  child: Center(
                                    child: Image.asset(
                                      restCareAudioController.idx.value == idx
                                          ? 'images/playing_audio_icon.png'
                                          : 'images/small_play_icon.png',
                                      height: supportUI.resWidth(16),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: supportUI.deviceWidth * 5 / 6,
                height: supportUI.resWidth(120),
                child: Padding(
                  padding: EdgeInsets.only(right: supportUI.resWidth(20)),
                  child: Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: typeWidget(restCareAudioModel.type),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  late final TextStyle _chipTextStyle = TextStyle(
      color: jakomoColor.white,
      fontFamily: supportUI.fontPoppings('semibold'),
      fontSize: supportUI.resFontSize(10),
      fontWeight: FontWeight.w900);

  Widget typeWidget(String type) {
    Widget result = Container();
    switch (type) {
      case 'new':
        result = Container(
          width: supportUI.resWidth(48),
          height: supportUI.resWidth(24),
          decoration: BoxDecoration(
              color: jakomoColor.pistachio,
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Center(
            child: Text(
              'NEW',
              style: _chipTextStyle,
            ),
          ),
        );
        break;
      case 'hot':
        result = Container(
          width: supportUI.resWidth(48),
          height: supportUI.resWidth(24),
          decoration: BoxDecoration(
              color: jakomoColor.boulder,
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Center(
            child: Text(
              'HOT',
              style: _chipTextStyle,
            ),
          ),
        );
        break;
    }
    return result;
  }

  Future<void> _bottomSheet(BuildContext context) async {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RestCareAudioItem(
              supportUI: supportUI,
              jakomoColor: jakomoColor,
              restCareAudioFactory: restCareAudioFactory,
              restCareAudioModel: restCareAudioModel);
        },
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))));
  }
}
