import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jakomo_recliner/UISupportUtils/jakomo_color.dart';
import 'package:jakomo_recliner/UISupportUtils/support_ui.dart';
import 'package:table_calendar/table_calendar.dart';

class JakomoCalendar extends StatefulWidget {
  final SupportUI supportUI;
  final JakomoColor jakomoColor;

  const JakomoCalendar(
      {Key? key, required this.supportUI, required this.jakomoColor})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _JakomoCalendar();
}

class _JakomoCalendar extends State<JakomoCalendar> {
  late final SupportUI supportUI = widget.supportUI;
  late final JakomoColor jakomoColor = widget.jakomoColor;
  late final _headerTextStyle = TextStyle(
      color: jakomoColor.mineShaft,
      fontFamily: supportUI.fontPoppings('bold'),
      fontSize: supportUI.resFontSize(16),
      fontWeight: FontWeight.w900);
  late final TextStyle _daysOfWeekTextStyle = TextStyle(
      color: jakomoColor.nobel,
      fontWeight: FontWeight.w400,
      fontSize: supportUI.resFontSize(13),
      fontFamily: supportUI.fontNanum('r'));
  late final TextStyle _dayTextStyle = TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: supportUI.fontPoppings('medium'),
      fontSize: supportUI.resFontSize(13),
      color: jakomoColor.scorpion);
  late final TextStyle _todayTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: supportUI.fontPoppings('medium'),
      fontSize: supportUI.resFontSize(13),
      color: jakomoColor.white);
  late final TextStyle _outLinedTextStyle = TextStyle(
      fontFamily: supportUI.fontPoppings('medium'),
      fontWeight: FontWeight.bold,
      fontSize: supportUI.resFontSize(13),
      color: jakomoColor.alto);

  DateTime chosenDate = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.deviceWidth * 6 / 7,
      height: supportUI.deviceWidth * 5 / 6,
      decoration: BoxDecoration(
          color: jakomoColor.white,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: jakomoColor.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 10,
              // offset: const Offset(4.0, 2.0)
            ),
          ]),
      child: Padding(
        padding: EdgeInsets.only(
            left: supportUI.resWidth(10),
            right: supportUI.resWidth(10),
            top: supportUI.resWidth(20)),
        child: TableCalendar(
          eventLoader: _eventLoader,
          calendarStyle: _calendarStyle,
          daysOfWeekStyle: _daysOfWeekStyle,
          daysOfWeekHeight: supportUI.resWidth(30),
          rowHeight: supportUI.resWidth(30),
          headerStyle: HeaderStyle(
              headerPadding: EdgeInsets.only(bottom: supportUI.resWidth(5)),
              headerMargin: EdgeInsets.zero,
              titleCentered: true,
              titleTextFormatter: (DateTime dateTime, dynamic anything) {
                return '${dateTime.year}.${dateTime.month}';
              },
              formatButtonVisible: false,
              formatButtonShowsNext: false,
              leftChevronIcon: SizedBox(
                width: supportUI.resWidth(24),
                height: supportUI.resWidth(24),
                child: Image.asset(
                  'images/activate_navigation_previous_icon.png',
                  fit: BoxFit.fill,
                ),
              ),
              rightChevronIcon: SizedBox(
                width: supportUI.resWidth(24),
                height: supportUI.resWidth(24),
                child: Image.asset(
                  'images/activate_navigation_next_icon.png',
                  fit: BoxFit.fill,
                ),
              ),
              titleTextStyle: _headerTextStyle),
          locale: 'ko-KR',
          focusedDay: DateTime.now(),
          firstDay: DateTime.utc(2020),
          lastDay: DateTime.utc(2023),
          onDaySelected: _onDaySelected,
          selectedDayPredicate: (day) => isSameDay(chosenDate, day),
          calendarBuilders: _calendarBuilders(),
        ),
      ),
    );
  }

  List<dynamic> _eventLoader(DateTime date) {
    List<dynamic> result = [];
    if (date.day == 2 || date.day == 4) {
      result.add(date);
    }
    return result;
  }

  void _onDaySelected(DateTime day, DateTime e) {
    setState(() {
      chosenDate = day;
    });
  }

  late final CalendarStyle _calendarStyle = CalendarStyle(
    weekendTextStyle: _dayTextStyle,
    holidayTextStyle: _dayTextStyle,
    todayTextStyle: _dayTextStyle,
    defaultTextStyle: _dayTextStyle,
    outsideTextStyle: _outLinedTextStyle,
    cellPadding: EdgeInsets.zero,
    cellMargin: EdgeInsets.symmetric(horizontal: supportUI.resWidth(8)),
    disabledTextStyle: _outLinedTextStyle,
    selectedTextStyle: _dayTextStyle,
    todayDecoration: BoxDecoration(
      color: jakomoColor.transperent,
    ),
  );
  late final DaysOfWeekStyle _daysOfWeekStyle = DaysOfWeekStyle(
      weekdayStyle: _daysOfWeekTextStyle, weekendStyle: _daysOfWeekTextStyle);

  CalendarBuilders _calendarBuilders() {
    return CalendarBuilders(
      selectedBuilder: (context, date, _) {
        return _calendarContainer(date, true);
      },
      markerBuilder: (context, date, events) {
        for (DateTime _date in events) {
          if (date == _date) {
            return _calendarContainer(date, false);
          } else {
            return Container();
          }
        }
      },
    );
  }
  Widget _calendarContainer(DateTime date, bool isSelected) {
    return Container(
      width: supportUI.resWidth(32),
      height: supportUI.resHeight(32),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          color: isSelected ? jakomoColor.pistachio : jakomoColor.mercury),
      child: Center(
        child: Text(
          date.day.toString(),
          style: isSelected ? _todayTextStyle : _dayTextStyle,
        ),
      ),
    );
  }
}
