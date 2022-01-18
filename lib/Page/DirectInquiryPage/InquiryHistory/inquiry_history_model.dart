class InquiryHistoryModel{
  final int idx;
  final String title;
  final String date;
  final int state;
  final String contents;
  final List<String> img;
  InquiryHistoryModel({
    required this.idx,
    required this.title,
    required this.date,
    required this.state,
    required this.contents,
    required this.img
  });
}
