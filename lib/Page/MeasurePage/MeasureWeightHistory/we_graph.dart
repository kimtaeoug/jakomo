import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureWeightHistory/we_history_controller.dart';
import 'package:jakomo_recliner/Page/MeasurePage/MeasureWeightHistory/we_model.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';

class WEGraph extends StatelessWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;
  final Map<DateTime, List<WEModel>> data;

  WEGraph(
      {Key? key,
      required this.supportUI,
      required this.jakomoColor,
      required this.data})
      : super(key: key);
  final WEHistoryController weHistoryController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: supportUI.deviceWidth,
      height: supportUI.resHeight(200),
      child: Obx(() {
        return LineChart(weightDataLine(context, data));
      }),
    );
  }

  late final TextStyle _todayTextStyle = TextStyle(
      color: jakomoColor.yukonGold,
      fontWeight: FontWeight.bold,
      fontSize: supportUI.resFontSize(13),
      fontFamily: supportUI.fontPoppings('semibold'));
  late final TextStyle _notTodayTextStyle = TextStyle(
      color: jakomoColor.boulder,
      fontWeight: FontWeight.bold,
      fontSize: supportUI.resFontSize(13),
      fontFamily: supportUI.fontPoppings('semibold'));
  late final TextStyle _noneDataextStyle = TextStyle(
      color: jakomoColor.silver,
      fontWeight: FontWeight.bold,
      fontSize: supportUI.resFontSize(13),
      fontFamily: supportUI.fontPoppings('semibold'));
  late final List<Color> lineChartColor = [jakomoColor.iron];

  LineChartData weightDataLine(
      BuildContext context, Map<DateTime, List<WEModel>> data) {
    final DateTime now = DateTime.now();
    return LineChartData(
        lineTouchData: LineTouchData(enabled: false),
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
            show: true,
            rightTitles: SideTitles(showTitles: false),
            topTitles: SideTitles(showTitles: false),
            leftTitles: SideTitles(showTitles: false),
            bottomTitles: SideTitles(
                showTitles: true,
                margin: supportUI.resHeight(10),
                interval: 1,
                //x축 라벨
                getTextStyles: (context, value) {
                  if (value == 7.0) {
                    return _todayTextStyle;
                  }
                  if (weHistoryController
                      .getData(
                          data, weHistoryController.dateList[value.toInt()])
                      .isEmpty) {
                    return _noneDataextStyle;
                  } else {
                    return _notTodayTextStyle;
                  }
                },
                getTitles: (value) => weHistoryController
                    .dateList[value.toInt()].day
                    .toString())),
        borderData: FlBorderData(show: false),
        minY: 0,
        maxY: 150,
        lineBarsData: [
          LineChartBarData(
            spots: [
              weHistoryController.convertFlSpot(
                  0,
                  weHistoryController.getData(
                      data, weHistoryController.dateList[0])),
              weHistoryController.convertFlSpot(
                  1,
                  weHistoryController.getData(
                      data, weHistoryController.dateList[1])),
              weHistoryController.convertFlSpot(
                  2,
                  weHistoryController.getData(
                      data, weHistoryController.dateList[2])),
              weHistoryController.convertFlSpot(
                  3,
                  weHistoryController.getData(
                      data, weHistoryController.dateList[3])),
              weHistoryController.convertFlSpot(
                  4,
                  weHistoryController.getData(
                      data, weHistoryController.dateList[4])),
              weHistoryController.convertFlSpot(
                  5,
                  weHistoryController.getData(
                      data, weHistoryController.dateList[5])),
              weHistoryController.convertFlSpot(
                  6,
                  weHistoryController.getData(
                      data, weHistoryController.dateList[6])),
              weHistoryController.convertFlSpot(
                  7,
                  weHistoryController.getData(
                      data, weHistoryController.dateList[7])),
              weHistoryController.convertFlSpot(
                  8,
                  weHistoryController.getData(
                      data, weHistoryController.dateList[8])),
              weHistoryController.convertFlSpot(
                  9,
                  weHistoryController.getData(
                      data, weHistoryController.dateList[9])),
            ],
            isCurved: false,
            colors: lineChartColor,
            barWidth: 2.5,
            dotData: FlDotData(
                checkToShowDot: (FlSpot data, LineChartBarData lineData) {
              if (data.y != 0) {
                return true;
              } else {
                return false;
              }
            }, getDotPainter:
                    (FlSpot spot, double a, LineChartBarData lineData, int b) {
              if (weHistoryController.sameDay(
                  weHistoryController.dateList[spot.x.toInt()], now)) {
                return FlDotCirclePainter(
                    color: jakomoColor.pistachio,
                    strokeColor: jakomoColor.pistachio,
                    radius: supportUI.resHeight(2));
              } else {
                return FlDotCirclePainter(
                    color: jakomoColor.boulder,
                    strokeColor: jakomoColor.boulder,
                    radius: supportUI.resHeight(2));
              }
            }),
          )
        ]);
  }
}
