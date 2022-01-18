import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_ble_connection.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_calendar.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_concrete_button.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_concrete_rectangle_button.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_convert_state.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_error_guide.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_history_bar.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_history_date_controller_ui.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_no_history.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_operation_time.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_page_top.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_pistachio_big_button.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_pistachio_border_button.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_pistachio_rectangle_button.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_pistachio_small_button.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_recommend_pop_up.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_signin_dot.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_text_form.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_title_with_line.dart';
import 'package:jakomo_recliner/Page/CommonUI/stress_ui.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class CommonUI {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  CommonUI({required this.supportUI, required this.jakomoColor});

  Widget pistachioSmallButton(String button) => JakomoPistachioSmallButton(
      supportUI: supportUI, jakomoColor: jakomoColor, button: button);

  Widget pistachioBigButton(String button) => JakomoPistachioBigButton(
      supportUI: supportUI, jakomoColor: jakomoColor, button: button);

  Widget pistachioRectangleButton(String button) =>
      JakomoPistachioRectangleButton(
          supportUI: supportUI, jakomoColor: jakomoColor, button: button);

  Widget concreteButton(String button) => JakomoConcreteButton(
      supportUI: supportUI, jakomoColor: jakomoColor, button: button);

  Widget errorGuide(String errorText) => JakomoErrorGuide(
      supportUI: supportUI, jakomoColor: jakomoColor, errorText: errorText);

  Widget textForm(Color color, Widget widget) => JakomoTextForm(
      supportUI: supportUI,
      jakomoColor: jakomoColor,
      color: color,
      widget: widget);

  Widget pageTop(String title, String titleEn) => JakomoPageTop(
        supportUI: supportUI,
        jakomoColor: jakomoColor,
        title: title,
        titleEn: titleEn,
      );

  Widget operationTime() =>
      JakomoOperationTime(supportUI: supportUI, jakomoColor: jakomoColor);

  Widget pistachioBorderButton(String button) => JakomoPistachioBorderButton(
      supportUI: supportUI, jakomoColor: jakomoColor, button: button);

  Widget signinDot(String text) => JakomoSigninDot(
        supportUI: supportUI,
        jakomoColor: jakomoColor,
        text: text,
      );

  Widget concreteRectangleButton(String button) =>
      JakomoConcreteRectangleButton(
          supportUI: supportUI, jakomoColor: jakomoColor, button: button);

  Widget histordyDateControllerUI(voidFunc left, voidFunc right, String date) =>
      JakomoHistoryDateControllerUI(
          supportUI: supportUI,
          jakomoColor: jakomoColor,
          left: left,
          right: right,
          date: date);

  Widget historyBar(DateTime date, bool noneData, bool today, bool focus, double height) =>
      JakomoHistoryBar(
          supportUI: supportUI,
          jakomoColor: jakomoColor,
          date: date,
          noneData: noneData,
          today: today,
          focus: focus,
          height: height);
  Widget convertState(int idx) => JakomoConvertState(supportUI: supportUI, jakomoColor: jakomoColor, idx: idx);
  Widget calendar() => JakomoCalendar(supportUI: supportUI, jakomoColor: jakomoColor);
  Widget stressUI(int value) => StressUI(supportUI: supportUI, jakomoColor: jakomoColor, value: value);
  Widget bleConnection() => JakomoBLEConnection(supportUI: supportUI, jakomoColor: jakomoColor);
  Widget noHistory() => JakomoNoHistory(supportUI: supportUI, jakomoColor: jakomoColor);
  Widget recommendPopUp()=>JakomoRecommendPopUp(supportUI: supportUI, jakomoColor: jakomoColor);
  Widget titleWithLine(String title, String line) => JakomoTitleWithLine(supportUI: supportUI, jakomoColor: jakomoColor, title: title, line: line);
}
