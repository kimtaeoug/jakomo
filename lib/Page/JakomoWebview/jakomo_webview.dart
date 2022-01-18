import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';
import 'package:webview_flutter/webview_flutter.dart';

class JakomoWebview extends StatelessWidget{
  final SupportUI supportUI = SupportUI();
  final JakomoColor jakomoColor = JakomoColor();
  JakomoWebview({Key? key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: WillPopScope(
        onWillPop: (){
          Get.back();
          return Future(()=>false);
        },
       child: const WebView(
         initialUrl: 'https://www.jakomo.co.kr/',
         javascriptMode: JavascriptMode.unrestricted,
       ),
      ),
    ));
  }

}