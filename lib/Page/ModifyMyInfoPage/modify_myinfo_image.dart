import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class ModifyMyinfoImage extends StatefulWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  const ModifyMyinfoImage(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ModifyMyinfoImage();
}

class _ModifyMyinfoImage extends State<ModifyMyinfoImage> {
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  final ImagePicker _imagePicker = ImagePicker();
  late final TextStyle _modifyTextStyle = TextStyle(
    color: jakomoColor.pistachio,
    fontWeight: FontWeight.w700,
    fontSize: supportUI.resFontSize(12),
    fontFamily: supportUI.fontNanum('eb'),
  );
  late final TextStyle _cancelTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontSize: supportUI.resFontSize(12),
      fontWeight: FontWeight.w700,
      fontFamily: supportUI.fontNanum('eb'));
  XFile? selectedFile;

  @override
  void initState() {
    super.initState();
    selectedFile = null;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: supportUI.resWidth(40), bottom: supportUI.resWidth(20)),
            child: Container(
              width: supportUI.resWidth(120),
              height: supportUI.resWidth(120),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(52)),
                  image: selectedFile != null
                      ? DecorationImage(
                          image: FileImage(File(selectedFile!.path)),
                          fit: BoxFit.cover)
                      : const DecorationImage(
                          image: AssetImage('images/profile_img.png'),
                          fit: BoxFit.cover)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => _selectImage(),
                child: Text(
                  '수정',
                  style: _modifyTextStyle,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: supportUI.resWidth(12)),
                child: Container(
                  width: supportUI.resWidth(1),
                  height: supportUI.resHeight(10),
                  decoration: BoxDecoration(
                    color: jakomoColor.boulder.withOpacity(0.3),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedFile = null;
                  });
                },
                child: Text(
                  '삭제',
                  style: _cancelTextStyle,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<XFile?> _selectImage() async {
    await _imagePicker.pickImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        setState(() {
          selectedFile = value;
        });
      }
    });
  }
}
