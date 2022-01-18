import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/Page/HomePage/JakomoUsefulInfo/jakomo_useful_info_model.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class JakomoUsefulInfoItem extends StatelessWidget{
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final JakomoUsefulInfoModel jakomoUsefulInfoModel;
  JakomoUsefulInfoItem({Key? key, required this.supportUI, required this.jakomoColor, required this.jakomoUsefulInfoModel}):super(key: key);
  late final TextStyle _titleTextStyle = TextStyle(
    color: jakomoColor.white,
    fontSize: supportUI.resFontSize(14),
    fontFamily: supportUI.fontNanum('eb'),
    height: 1.5,
    fontWeight: FontWeight.w600
  );
  late final TextStyle _contentsTextStyle = TextStyle(
    color: jakomoColor.white.withOpacity(0.6),
    fontSize: supportUI.resFontSize(12),
    fontFamily: supportUI.fontNanum('r'),
    fontWeight: FontWeight.w100
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: supportUI.resWidth(20)),
      child: SizedBox(
        width: supportUI.resWidth(200),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: supportUI.resWidth(200),
              height: supportUI.resWidth(114),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                  image: DecorationImage(
                      image: AssetImage(jakomoUsefulInfoModel.infoImage),
                      fit: BoxFit.fill
                  )
              ),
            ),
            Container(
              width: supportUI.resWidth(200),
              height: supportUI.resWidth(98),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(15)),
                  color: jakomoUsefulInfoModel.infoColor
              ),
              child: Padding(
                padding: EdgeInsets.only(left: supportUI.resWidth(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: supportUI.resWidth(180),
                      child: Text(
                        jakomoUsefulInfoModel.infoTitle,
                        style: _titleTextStyle,
                        textAlign: TextAlign.start,
                        softWrap: true,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: supportUI.resHeight(8)),
                      child: SizedBox(
                        width: supportUI.resWidth(180),
                        child: Text(
                          jakomoUsefulInfoModel.infoContents,
                          style: _contentsTextStyle,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}