import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/MemberShip/FindMemberShip/FindId/find_id_controller.dart';
import 'package:jakomo_recliner/Page/MemberShip/FindMemberShip/FindId/find_id_timer_controller.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class FindIdTimer extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  FindIdTimer({Key? key, required this.supportUI, required this.jakomoColor}):super(key: key);
  late final TextStyle _textStyle = TextStyle(
      color: jakomoColor.azureRadiance,
      fontSize: supportUI.resFontSize(12),
      fontFamily: supportUI.fontPoppings('bold')
  );
  late final TextStyle buttonTextStyle = TextStyle(
      color: jakomoColor.mineShaft,
      fontWeight: FontWeight.bold,
      fontSize: supportUI.resFontSize(10),
      fontFamily: supportUI.fontNanum('b'));
  final FindIdTimerController jakomoAuthTimerController = Get.find();
  final FindIdController signinController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: supportUI.resWidth(50),
      height: supportUI.resHeight(24),
      child: Center(
        child: Obx((){
          if(signinController.didPhoneAuth.value){
            jakomoAuthTimerController.killTimer();
            return SizedBox(
              width: supportUI.resWidth(24),
              height: supportUI.resHeight(24),
              child: Image.asset('images/confirmed_check_icon.png', fit: BoxFit.cover,),
            );
          }else{
            RxString timeValue = jakomoAuthTimerController.time;
            // if(timeValue.value == '00:01'){
            //   signinController.overFlowTime();
            // }
            return Text(timeValue.value == '00:01'?'':timeValue.value, style: _textStyle,);
          }
        }),
      ),
    );
  }
}
