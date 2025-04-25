// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_quality_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirQualityData _$AirQualityDataFromJson(Map<String, dynamic> json) =>
    AirQualityData(
      time: json['time'] as String,
      interval: (json['interval'] as num).toInt(),
      uvIndex: (json['uv_index'] as num).toDouble(),
      grassPollen: (json['grass_pollen'] as num?)?.toDouble(),
      pm10: (json['pm10'] as num).toDouble(),
    );
