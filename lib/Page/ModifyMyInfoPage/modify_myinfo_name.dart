import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/Page/CommonUI/common_ui.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class ModifyMyinfoName extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final CommonUI commonUI;

  ModifyMyinfoName(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.commonUI})
      : super(key: key);
  late final TextStyle _labelTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontSize: supportUI.resFontSize(10),
      fontFamily: supportUI.fontNanum('r'));
  late final TextStyle _valueTextStyle = TextStyle(
      color: jakomoColor.black,
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontPoppings('regular'));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: supportUI.resHeight(12)),
      child: commonUI.textForm(
          jakomoColor.gallery,
          TextFormField(
            style: _valueTextStyle,
            keyboardType: TextInputType.none,
            initialValue: '이은하',
            decoration: InputDecoration(
              enabled: false,
              labelText: '이름',
              labelStyle: _labelTextStyle,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          )),
    );
  }
}
// class ModifyMyinfoName extends StatelessWidget{
//   final SupportUI supportUI;
//   final JakomoColor jakomoColor;
//
//   ModifyMyinfoName(
//       {Key? key, required this.supportUI, required this.jakomoColor})
//       : super(key: key);
//   late final TextStyle _labelTextStyle = TextStyle(
//       color : jakomoColor.boulder,
//       fontSize: supportUI.resFontSize(10),
//       fontFamily: supportUI.fontNanum('r'));
//   late final TextStyle _valueTextStyle = TextStyle(
//       color: jakomoColor.black,
//       fontSize: supportUI.resFontSize(14),
//       fontFamily: supportUI.fontPoppings('regular'));
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: supportUI.resHeight(12)),
//       child: Container(
//         width: supportUI.deviceWidth * 5 / 6,
//         height: supportUI.resHeight(56),
//         decoration: BoxDecoration(
//             color: jakomoColor.white,
//             borderRadius:
//             const BorderRadius.all(Radius.circular(12)),
//             border: Border.all(color:jakomoColor.gallery)),
//         child: Padding(
//           padding: EdgeInsets.only(left: supportUI.resWidth(20)),
//           child: Center(
//             child: TextFormField(
//               style: _valueTextStyle,
//               keyboardType: TextInputType.none,
//               initialValue: '이은하',
//               decoration: InputDecoration(
//                 enabled: false,
//                 labelText: '이름',
//                 labelStyle: _labelTextStyle,
//                 border: InputBorder.none,
//                 focusedBorder: InputBorder.none,
//                 enabledBorder: InputBorder.none,
//                 errorBorder: InputBorder.none,
//                 disabledBorder: InputBorder.none,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
