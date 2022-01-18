import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/BLE/ble_controller.dart';
import 'package:jakomo_recliner/Page/BottomNavigation/bottom_navigation_controller.dart';
import 'package:jakomo_recliner/Routes/jakomo_routes.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class JakomoFloatingButton extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  JakomoFloatingButton(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);
  final BLEController bleController = Get.find();
  final BottomNavigationController bottomNavigationController = Get.find();
  late final TextStyle _textStyle = TextStyle(
      fontFamily: supportUI.fontNanum('r'),
      color: jakomoColor.white,
      fontSize: supportUI.resFontSize(10),
      fontWeight: FontWeight.bold);

  late final Size textSize = supportUI.getTextSize2('리클라이닝', _textStyle);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (bleController.connection.value == false) {
          Get.toNamed(JakomoRoutes.connection);
        } else {
          Get.toNamed(JakomoRoutes.control);
        }
      },
      child: Obx(() {
        return AnimatedContainer(
          width: bottomNavigationController.scrollNow.value
              ? supportUI.resWidth(100)
              : supportUI.resWidth(52),
          height: supportUI.resWidth(52),
          duration: const Duration(milliseconds: 100),
          decoration: BoxDecoration(
              color: jakomoColor.mineShaft,
              borderRadius: const BorderRadius.all(Radius.circular(50))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: supportUI.resWidth(25),
                height: supportUI.resHeight(20),
                child: Image.asset(
                  'images/floating_icon.png',
                  fit: BoxFit.fill,
                ),
              ),
              bottomNavigationController.scrollNow.value?
                  FutureBuilder(
                      future: Future.delayed(const Duration(milliseconds: 100)),
                      builder: (context, snapshot){
                        if(snapshot.connectionState == ConnectionState.done){
                          return Padding(
                            padding: EdgeInsets.only(left: supportUI.resWidth(3),),
                            child: TextOfFloatingButton(supportUI: supportUI, jakomoColor: jakomoColor),
                          );
                        }else{
                          return Container();
                        }
                  }):Container()
            ],
          ),
        );
      }),
    );
  }
}

class TextOfFloatingButton extends StatefulWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  const TextOfFloatingButton(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _TextOfFloatingButton();
}

class _TextOfFloatingButton extends State<TextOfFloatingButton>
    with TickerProviderStateMixin {
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 200),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  late final TextStyle _textStyle = TextStyle(
      fontFamily: supportUI.fontNanum('r'),
      color: jakomoColor.white,
      fontSize: supportUI.resFontSize(10),
      fontWeight: FontWeight.bold);

  late final Size textSize = supportUI.getTextSize2('리클라이닝', _textStyle);
  final BottomNavigationController bottomNavigationController = Get.find();

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return SizeTransition(
        sizeFactor: _animation,
        axisAlignment: 1,
        axis: Axis.horizontal,
        child: Center(
          child: Text('리클라이너', style: _textStyle),
        ),
    );
  }
}

