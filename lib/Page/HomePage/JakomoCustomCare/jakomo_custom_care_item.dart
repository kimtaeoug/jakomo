import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/HomePage/JakomoCustomCare/jakomo_custom_care_model.dart';
import 'package:jakomo_recliner/Page/HomePage/JakomoCustomCare/jakomo_custom_care_tag.dart';
import 'package:jakomo_recliner/Routes/jakomo_routes.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class JakomoCustomCareItem extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final JakomoCustomCareModel jakomoCustomCareModel;

  JakomoCustomCareItem(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.jakomoCustomCareModel})
      : super(key: key);
  late final TextStyle _titleTextStyle = TextStyle(
      color: jakomoColor.woodSmoke,
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontNanum('eb'),
      fontWeight: FontWeight.bold);
  late final TextStyle _contentsTextStyle = TextStyle(
      color: jakomoColor.woodSmoke.withOpacity(0.6),
      fontFamily: supportUI.fontNanum('r'),
      fontSize: supportUI.resFontSize(12));

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(JakomoRoutes.restItem,
            arguments: {'model': jakomoCustomCareModel});
      },
      child: SizedBox(
        width: supportUI.resWidth(300),
        height: supportUI.resWidth(300),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: supportUI.resWidth(300),
              height: supportUI.resWidth(170),
              decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(15)),
                  image: DecorationImage(
                      image: AssetImage(jakomoCustomCareModel.img),
                      fit: BoxFit.fill)),
            ),
            Container(
              decoration: BoxDecoration(
                  color: jakomoColor.boulder.withOpacity(0.2),
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(15))),
              child: Container(
                margin: const EdgeInsets.only(left: 1, right: 1, bottom: 1),
                width: supportUI.resWidth(298),
                height: supportUI.resWidth(129),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(15)),
                    color: jakomoColor.white),
                child: Center(
                  child: SizedBox(
                    height: supportUI.resWidth(100),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: supportUI.resWidth(20), top: supportUI.resHeight(5)),
                          child: Align(
                            alignment: AlignmentDirectional.topStart,
                            child: SizedBox(
                              height: supportUI.resWidth(22),
                              child: Text(
                                jakomoCustomCareModel.title,
                                style: _titleTextStyle,
                                textAlign: TextAlign.start,
                                softWrap: true,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: supportUI.resWidth(20)),
                          child: Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: SizedBox(
                              width: supportUI.resWidth(215),
                              height: supportUI.resWidth(40),
                              child: Text(
                                jakomoCustomCareModel.contents,
                                style: _contentsTextStyle,
                                textAlign: TextAlign.start,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: supportUI.resWidth(20)),
                          child: SizedBox(
                            width: supportUI.resWidth(280),
                            height: supportUI.resWidth(28),
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: jakomoCustomCareModel.tagList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, idx) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        right: supportUI.resWidth(4)),
                                    child: JakomoCustomCareTag(
                                        supportUI: supportUI,
                                        jakomoColor: jakomoColor,
                                        tag:
                                            jakomoCustomCareModel.tagList[idx]),
                                  );
                                }),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
