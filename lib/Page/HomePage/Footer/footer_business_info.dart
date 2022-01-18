import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class FooterBusinessInfo extends StatefulWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final TextStyle etcTextStyle;
  final TextStyle headTextStyle;
  final TextStyle tailTextStyle;

  const FooterBusinessInfo(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.etcTextStyle,
      required this.headTextStyle,
      required this.tailTextStyle})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _FooterBusinessInfo();
}

class _FooterBusinessInfo extends State<FooterBusinessInfo> {
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  late final TextStyle etcTextStyle = widget.etcTextStyle;
  late final TextStyle headTextStyle = widget.headTextStyle;
  late final TextStyle tailTextStyle = widget.tailTextStyle;

  bool _open = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: supportUI.resHeight(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '사업자 정보',
                style: etcTextStyle,
              ),
              Padding(
                padding: EdgeInsets.only(left: supportUI.resWidth(10)),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _open = !_open;
                    });
                  },
                  child: Image.asset(
                    _open ? 'images/fold_icon.png' : 'images/open_icon.png',
                    width: supportUI.resWidth(15),
                    height: supportUI.resWidth(15),
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          ),
        ),
        AnimatedContainer(
          curve: Curves.easeIn,
          height: _open ? _headTextSize() * 4 + supportUI.resWidth(20) : 0,
          duration: const Duration(milliseconds: 600),
          child: _businessInfoTotal(),
        )
      ],
    );
  }
  Widget _businessInfoTotal(){
    return FutureBuilder(
        future: Future.delayed(const Duration(milliseconds: 600)),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _businessInfoItem('대표이사', '박경분'),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: supportUI.resWidth(5)),
                  child: _businessInfoItem('사업자등록번호', '132-81-62165'),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: supportUI.resWidth(5)),
                  child: _businessInfoItem('주소', '경기도 남양주시 오남읍 진건오남로929번길 8'),
                ),
                _businessInfoItem('이메일', 'admin@sample.com')
              ],
            );
          }else{
            return Container();
          }
        });
  }

  Widget _businessInfoItem(String head, String tail) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          head,
          style: headTextStyle,
        ),
        Padding(
          padding: EdgeInsets.only(left: supportUI.resWidth(3)),
          child: Text(
            tail,
            style: tailTextStyle,
          ),
        )
      ],
    );
  }

  double _headTextSize() {
    final TextPainter _textPainter = TextPainter(
        text: TextSpan(text: '대표이사', style: headTextStyle),
        textDirection: TextDirection.ltr)
      ..layout();
    return _textPainter.size.height;
  }
}
