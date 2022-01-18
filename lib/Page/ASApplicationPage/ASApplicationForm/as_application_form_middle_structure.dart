import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/Page/ASApplicationPage/ASApplicationForm/as_application_form_contents.dart';
import 'package:jakomo_recliner/Page/ASApplicationPage/ASApplicationForm/as_application_form_select.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class ASApplicationFormMiddleStructure extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  const ASApplicationFormMiddleStructure({Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: supportUI.deviceWidth,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: supportUI.resWidth(60),
              ),
              ASApplicationFormContents(supportUI: supportUI, jakomoColor: jakomoColor)
            ],
          ),
          Center(
            child: ASApplicationFormSelect(supportUI: supportUI, jakomoColor: jakomoColor),
          )
        ],
      ),
    );
  }
}
