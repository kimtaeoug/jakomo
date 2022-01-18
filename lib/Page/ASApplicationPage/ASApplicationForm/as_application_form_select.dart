import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class ASApplicationFormSelect extends StatefulWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  ASApplicationFormSelect(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);
  final List<String> _selectList = ['상품 문의', '시스템 문의', '기타 문의'];
  late final TextStyle _selectTextStyle = TextStyle(
      fontFamily: supportUI.fontNanum('r'),
      color: jakomoColor.boulder,
      fontSize: supportUI.resFontSize(14));

  @override
  State<StatefulWidget> createState() => _ASApplicationFormSelect();
}

class _ASApplicationFormSelect extends State<ASApplicationFormSelect> {
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  late final List<String> selectList = widget._selectList;
  late final TextStyle _selectTextStyle = widget._selectTextStyle;
  bool _dropDownOpen = false;
  String _selected = 'AS 문의 내용을 선택해주세요.';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.deviceWidth * 5 / 6,
      height: _dropDownOpen
          ? supportUI.resWidth(56) * 4 + supportUI.resWidth(10)
          : supportUI.resWidth(60),
      decoration: BoxDecoration(
          color: jakomoColor.white,
          border: Border.all(color: jakomoColor.gallery, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: supportUI.deviceWidth * 5 / 6,
            height: supportUI.resWidth(56),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: supportUI.resWidth(16)),
                  child: Text(
                    _selected,
                    style: _selectTextStyle,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: supportUI.resWidth(15)),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _dropDownOpen = !_dropDownOpen;
                      });
                    },
                    child: SizedBox(
                      width: supportUI.resWidth(18),
                      height: supportUI.resWidth(18),
                      child: Image.asset(_dropDownOpen?'images/fold_icon.png':'images/dropdown_icon.png'),
                    ),
                  ),
                )
              ],
            ),
          ),
          _dropDownOpen
              ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
                selectList.length,
                    (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      _selected = selectList[index];
                      _dropDownOpen = false;
                    });
                  },
                  child: ASApplicationFormSelectItem(
                      supportUI: supportUI,
                      jakomoColor: jakomoColor,
                      item: selectList[index]),
                )),
          )
              : Container(
                  height: 0,
                )
        ],
      ),
    );
  }
}

class ASApplicationFormSelectItem extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final String item;

  ASApplicationFormSelectItem(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.item})
      : super(key: key);

  late final TextStyle _itemTextStyle = TextStyle(
      color: jakomoColor.black,
      fontSize: supportUI.resFontSize(14),
      fontFamily: supportUI.fontNanum('r'));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: supportUI.deviceWidth * 5 / 6,
      height: supportUI.resWidth(56),
      child: Center(
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Padding(
            padding: EdgeInsets.only(left: supportUI.resWidth(16)),
            child: Text(
              item,
              style: _itemTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
