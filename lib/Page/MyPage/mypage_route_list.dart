import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/Page/MyPage/mypage_route_item.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class MyPageRouteList extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  MyPageRouteList({
    Key? key,
    required this.supportUI,
    required this.jakomoColor,
  }) : super(key: key);

  final List<int> _list = [1, 2, 3, 4, 5, 6, 7];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.deviceWidth,
      color: jakomoColor.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: supportUI.resWidth(21),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
                _list.length,
                (index) => MyPageRouteItem(
                    supportUI: supportUI,
                    jakomoColor: jakomoColor,
                    idx: _list[index])),
          ),
          SizedBox(
            height: supportUI.resWidth(16),
          )
        ],
      ),
    );
  }
}
