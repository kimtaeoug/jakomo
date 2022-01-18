// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measure_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeasureInputModel _$MeasureInputModelFromJson(Map<String, dynamic> json) {
  return MeasureInputModel(
    (json['weight'] as num).toDouble(),
    json['rawData'] as String,
  );
}

Map<String, dynamic> _$MeasureInputModelToJson(MeasureInputModel instance) =>
    <String, dynamic>{
      'weight': instance.weight,
      'rawData': instance.rawData,
    };
