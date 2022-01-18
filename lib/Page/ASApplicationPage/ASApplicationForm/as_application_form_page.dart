import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/ASApplicationPage/ASApplicationForm/as_application_form_calendar.dart';
import 'package:jakomo_recliner/Page/ASApplicationPage/ASApplicationForm/as_application_form_controller.dart';
import 'package:jakomo_recliner/Page/ASApplicationPage/ASApplicationForm/as_application_form_footer.dart';
import 'package:jakomo_recliner/Page/ASApplicationPage/ASApplicationForm/as_application_form_guide.dart';
import 'package:jakomo_recliner/Page/ASApplicationPage/ASApplicationForm/as_application_form_info.dart';
import 'package:jakomo_recliner/Page/ASApplicationPage/ASApplicationForm/as_application_form_middle_structure.dart';
import 'package:jakomo_recliner/Page/ASApplicationPage/ASApplicationForm/as_application_form_time.dart';
import 'package:jakomo_recliner/Page/ASApplicationPage/ASApplicationForm/as_application_img.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class ASApplicationFormPage extends StatelessWidget{
  final SupportUI supportUI = SupportUI();
  final JakomoColor jakomoColor = JakomoColor();
  late final CommonUI commonUI = CommonUI(supportUI: supportUI, jakomoColor: jakomoColor);
  ASApplicationFormPage({Key? key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: jakomoColor.white,
      body: WillPopScope(
        onWillPop: (){
          Get.back();
          return Future(()=>false);
        },
        child: SizedBox(
          width: supportUI.deviceWidth,
          height: supportUI.deviceHeight,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: supportUI.resWidth(40)),
                  child: commonUI.pageTop('신청하기', 'AS '),
                ),
                ASApplicationFormGuide(supportUI: supportUI, jakomoColor: jakomoColor),
                ASApplicationFormMiddleStructure(supportUI: supportUI, jakomoColor: jakomoColor),
                ASApplicationImg(supportUI: supportUI, jakomoColor: jakomoColor),
                Padding(
                  padding: EdgeInsets.only(
                      top: supportUI.resHeight(28),
                      bottom: supportUI.resWidth(36)
                  ),
                  child: Container(
                    color: jakomoColor.boulder.withOpacity(0.1),
                    width: supportUI.deviceWidth,
                    height: supportUI.resWidth(1),
                  ),
                ),
                ASApplicationFormCalendar(supportUI: supportUI, jakomoColor: jakomoColor, commonUI: commonUI,),
                ASApplicationFormTime(supportUI: supportUI, jakomoColor: jakomoColor),
                ASApplicationFormInfo(supportUI: supportUI, jakomoColor: jakomoColor),
                Container(
                  width: supportUI.deviceWidth,
                  height: supportUI.resHeight(10),
                  color: jakomoColor.concrete.withOpacity(0.6),
                ),
                ASApplicationFormFooter(supportUI: supportUI, jakomoColor: jakomoColor)
              ],
            ),
          ),
        ),
      ),
    ));
  }

}