import 'package:json_annotation/json_annotation.dart';

part 'measure_result_model.g.dart';
@JsonSerializable()
class MeasureResultModel{
  @JsonKey(name : "recordedTime")
  int recordedTime;
  @JsonKey(name : "uniqueID")
  int uniqueID;
  @JsonKey(name : "stress")
  double stress;
  @JsonKey(name : "heartRate")
  double heartRate;
  @JsonKey(name : "systolic")
  double systolic;
  @JsonKey(name : "diastolic")
  double diastolic;
  @JsonKey(name : "weight")
  double weight;
  MeasureResultModel({
    required this.recordedTime,
    required this.uniqueID,
    required this.stress,
    required this.heartRate,
    required this.systolic,
    required this.diastolic,
    required this.weight
  });
  factory MeasureResultModel.fromJson(Map<String, dynamic> json)=>_$MeasureResultModelFromJson(json);
  Map<String, dynamic> toJson() => _$MeasureResultModelToJson(this);
}