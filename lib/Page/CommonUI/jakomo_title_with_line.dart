import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class JakomoTitleWithLine extends StatefulWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final String title;
  final String line;
  const JakomoTitleWithLine(
      {Key? key, required this.supportUI, required this.jakomoColor, required this.title, required this.line})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _JakomoTitleWithLine();
}
class _JakomoTitleWithLine extends State<JakomoTitleWithLine>{
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  late final String title = widget.title;
  late final String line = widget.line;

  late final TextStyle _titleTextStyle = TextStyle(
      fontWeight: FontWeight.w700,
      color: jakomoColor.black,
      fontSize: supportUI.realFontSize(20));
  late final double lineWidth = supportUI.getTextSize(line, _titleTextStyle).width;
  late final double lineWidth2 = supportUI.getTextSize2(line, _titleTextStyle).width;
  late final double titleWidth =  supportUI.getTextSize(title, _titleTextStyle).width;
  late final double titleWidth2 = supportUI.getTextSize2(title, _titleTextStyle).width;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      if(mounted){
        try{
          Size? title = supportUI.getWidgetSize(_textKey);
          if(title != null){
            if(title.width > titleWidth + supportUI.resWidth(15)){
              setState(() {
                lineLess = true;
              });
            }
          }
        }catch(e){

        }
      }
    });
  }
  bool lineLess = false;
  final GlobalKey _textKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: supportUI.getTextSize(line, _titleTextStyle).height,
      child: Stack(
        children: [
          SizedBox(
            width: lineLess?titleWidth2:titleWidth,
            child: Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Container(
                width: lineLess?lineWidth2:lineWidth,
                height: supportUI.resHeight(5),
                decoration: BoxDecoration(
                    color: jakomoColor.pistachio.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(Radius.circular(30))),
              ),
            ),
          ),
          Text(
            title,
            key: _textKey,
            style: _titleTextStyle,
            textAlign: TextAlign.start,
          )
        ],
      ),
    );
  }
}