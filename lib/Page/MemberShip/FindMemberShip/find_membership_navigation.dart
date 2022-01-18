import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

import 'find_membership_controller.dart';
class FindMemberShipNavigation extends StatefulWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  FindMemberShipNavigation({Key? key, required this.supportUI, required this.jakomoColor}) :super(key: key);

  @override
  State<StatefulWidget> createState() => _FindMemberShipNavigation();

}
class _FindMemberShipNavigation extends State<FindMemberShipNavigation>{
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  late final TextStyle _activateTextStyle = TextStyle(
      color: jakomoColor.black,
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontNanum('eb'),
      fontWeight: FontWeight.bold
  );
  late final TextStyle _inActivateTextStyle = TextStyle(
      color: jakomoColor.mineShaft.withOpacity(0.2),
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontNanum('eb'),
      fontWeight: FontWeight.bold
  );
  late final Size _idSize = supportUI.getTextSize('아이디  찾기', _activateTextStyle);
  late final Size _idSize2 = supportUI.getTextSize2('아이디  찾기', _activateTextStyle);

  late final Size _pwdSize = supportUI.getTextSize('비밀번호 재설정', _activateTextStyle);
  late final Size _pwdSize2 = supportUI.getTextSize2('비밀번호 재설정', _activateTextStyle);

  final FindMemberShipController findMemberShipController = Get.find();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      if(mounted){
        Size? widgetSize = supportUI.getWidgetSize(_widgetKey);
        if(widgetSize!=null){
          if(widgetSize.width > _idSize.width + supportUI.resWidth(2)){
            setState(() {
              lineLess = true;
            });
          }
        }
      }
    });
  }
  final GlobalKey _widgetKey = GlobalKey();
  bool lineLess = false;
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: supportUI.resHeight(3.5), left: supportUI.commonLeft()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: supportUI.resWidth(16)),
                  child: GestureDetector(
                    onTap: (){
                      findMemberShipController.wichIdx.value = 1;
                    },
                    child: Text('아이디 찾기',key: _widgetKey, style: findMemberShipController.wichIdx.value == 1?_activateTextStyle:_inActivateTextStyle,),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    findMemberShipController.wichIdx.value = 2;
                  },
                  child: Text('비밀번호 재설정', style: findMemberShipController.wichIdx.value == 2?_activateTextStyle:_inActivateTextStyle,),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: supportUI.commonLeft()),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: SizedBox(
                width: lineLess?_idSize2.width + _pwdSize2.width + supportUI.resWidth(14):_idSize.width + _pwdSize.width + supportUI.resWidth(14),
                height: supportUI.resHeight(2),
                child: AnimatedAlign(
                  alignment: findMemberShipController.wichIdx.value == 1?AlignmentDirectional.centerStart:AlignmentDirectional.centerEnd,
                  duration:  const Duration(milliseconds: 500),
                  child: Container(
                    width: findMemberShipController.wichIdx.value == 1?lineLess?_idSize2.width:_idSize.width:lineLess?_pwdSize2.width:_pwdSize.width,
                    height: supportUI.resHeight(1.5),
                    color: jakomoColor.pistachio,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: supportUI.deviceWidth,
            height: supportUI.resHeight(1),
            color: jakomoColor.dustyGray.withOpacity(0.1),
          )
        ],
      );
    });
  }
}
