class MeasureHistoryItemModel{
  final DateTime date;
  final int heartRate;
  final int stress;
  final int systolic;
  final int diastolic;
  final int weight;
  final String advice;
  MeasureHistoryItemModel({
    required this.date,
    required this.heartRate,
    required this.stress,
    required this.systolic,
    required this.diastolic,
    required this.weight,
    required this.advice
  });
}