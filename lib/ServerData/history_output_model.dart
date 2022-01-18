import 'package:json_annotation/json_annotation.dart';
part 'history_output_model.g.dart';
@JsonSerializable()
class HistoryOutPutModel{
  @JsonKey(name: "recordedTime")
  int recordedTime;
  @JsonKey(name: "uniqueID")
  int uniqueID;
  @JsonKey(name: "stress")
  double stress;
  @JsonKey(name: "heartRate")
  double heartRate;
  @JsonKey(name: "systolic")
  double systolic;
  @JsonKey(name: "diastolic")
  double diastolic;
  @JsonKey(name: "weight")
  double weight;
  HistoryOutPutModel({
    required this.recordedTime,
    required this.uniqueID,
    required this.stress,
    required this.heartRate,
    required this.systolic,
    required this.diastolic,
    required this.weight
  });
  factory HistoryOutPutModel.fromJson(Map<String, dynamic> json) => _$HistoryOutPutModelFromJson(json);
  Map<String, dynamic> toJson() => _$HistoryOutPutModelToJson(this);
}
