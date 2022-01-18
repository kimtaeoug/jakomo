import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'as_application_form_controller.dart';

class ASApplicationImg extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  ASApplicationImg(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);
  late final TextStyle _registerTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontSize: supportUI.resFontSize(12),
      fontFamily: supportUI.fontNanum('b'),
      fontWeight: FontWeight.bold);
  final ImagePicker _imagePicker = ImagePicker();
  final ASApplicationFormController applicationFormController = Get.find();

  late final TextStyle _titleTextSTyle = TextStyle(
      color: jakomoColor.mineShaft,
      fontSize: supportUI.resFontSize(16),
      fontFamily: supportUI.fontNanum('eb'),
      fontWeight: FontWeight.bold);
  late final TextStyle _guideTextStyle = TextStyle(
      color: jakomoColor.woodSmoke.withOpacity(0.5),
      fontWeight: FontWeight.bold,
      fontFamily: supportUI.fontNanum('r'),
      fontSize: supportUI.resFontSize(12));

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: supportUI.commonLeft(), top: supportUI.resWidth(28)),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              '사진 첨부하기',
              style: _titleTextSTyle,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: supportUI.commonLeft(),
              top: supportUI.resWidth(10),
              bottom: supportUI.resWidth(20)),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              '문의과 무관한 사진을 첨부한 게시글은\n통보없이 삭제 및 혜택이 회수될 수 있습니다.',
              style: _guideTextStyle,
              textAlign: TextAlign.start,
            ),
          ),
        ),
        Center(
          child: SizedBox(
            width: supportUI.deviceWidth - supportUI.commonLeft() * 2,
            height: supportUI.resWidth(130),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: supportUI.resWidth(16)),
                    child: GestureDetector(
                      onTap: () {
                        _selectImage();
                      },
                      child: Container(
                        width: supportUI.resWidth(100),
                        height: supportUI.resWidth(100),
                        decoration: BoxDecoration(
                            color: jakomoColor.white,
                            boxShadow: [
                              BoxShadow(
                                color: jakomoColor.grey.withOpacity(0.2),
                                spreadRadius: 3,
                                blurRadius: 10,
                              ),
                            ],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8))),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: supportUI
                                    .getTextSize('사진 등록', _registerTextStyle)
                                    .width,
                                child: Center(
                                  child: Container(
                                    width: supportUI.resWidth(32),
                                    height: supportUI.resWidth(32),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: jakomoColor.emperor
                                            .withOpacity(0.1)),
                                    child: Center(
                                      child: SizedBox(
                                        width: supportUI.resWidth(20),
                                        height: supportUI.resWidth(20),
                                        child:
                                            Image.asset('images/add_icon.png'),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: supportUI.resWidth(10)),
                                child: Center(
                                  child: Text(
                                    '사진 등록',
                                    style: _registerTextStyle,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Obx(() {
                    return applicationFormController.imgList.isNotEmpty
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(
                                applicationFormController.imgList.length,
                                (index) => Padding(
                                      padding: EdgeInsets.only(
                                          right: supportUI.resWidth(16)),
                                      child: _imgItem(
                                          applicationFormController
                                              .imgList[index] as XFile,
                                          index),
                                    )),
                          )
                        : Container();
                  })
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Future<XFile?> _selectImage() async {
    await _imagePicker.pickImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        applicationFormController.imgList.add(value);
      }
    });
  }

  late final TextStyle _imgTextStyle = TextStyle(
      color: jakomoColor.silverChalice,
      fontFamily: supportUI.fontPoppings('regular'),
      fontSize: supportUI.resFontSize(12));

  Widget _imgItem(XFile input, int index) {
    return SizedBox(
      width: supportUI.resWidth(100),
      height: supportUI.resWidth(130),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: supportUI.resWidth(100),
            height: supportUI.resWidth(100),
            child: Stack(
              children: [
                Container(
                  width: supportUI.resWidth(100),
                  height: supportUI.resWidth(100),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      image:
                          DecorationImage(image: FileImage(File(input.path)),fit: BoxFit.cover),),
                ),
                SizedBox(
                  width: supportUI.resWidth(100),
                  height: supportUI.resWidth(100),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: supportUI.resWidth(8),
                        right: supportUI.resWidth(8)),
                    child: Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: GestureDetector(
                        onTap: () {
                          applicationFormController.imgList.removeAt(index);
                        },
                        child: Container(
                          width: supportUI.resWidth(24),
                          height: supportUI.resWidth(24),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: jakomoColor.silverChalice),
                          child: Center(
                            child: SizedBox(
                              width: supportUI.resWidth(11.5),
                              height: supportUI.resWidth(11.5),
                              child: Image.asset('images/close_icon.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: supportUI.resWidth(100),
            height: supportUI.resWidth(30),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                '123455512344…',
                style: _imgTextStyle,
              ),
            ),
          )
        ],
      ),
    );
  }
}
