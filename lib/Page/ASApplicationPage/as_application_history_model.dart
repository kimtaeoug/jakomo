class ASApplicationHistoryModel{
  final int idx;
  final String title;
  final String date;
  final String time;
  final int state;
  final String name;
  final String phoneNumber;
  final String address;
  final String contents;
  final List<String> img;
  ASApplicationHistoryModel({
     required this.idx,
    required this.title,
    required this.date,
    required this.time,
    required this.state,
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.contents,
    required this.img
  });
}