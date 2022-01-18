import 'package:json_annotation/json_annotation.dart';

part 'measure_input_model.g.dart';
@JsonSerializable()
class MeasureInputModel{
  @JsonKey(name : "weight")
  double weight;
  @JsonKey(name : "rawData")
  String rawData;
  MeasureInputModel(this.weight, this.rawData);
  factory MeasureInputModel.fromJson(Map<String, dynamic> json) => _$MeasureInputModelFromJson(json);
  Map<String, dynamic> toJson() => _$MeasureInputModelToJson(this);
}