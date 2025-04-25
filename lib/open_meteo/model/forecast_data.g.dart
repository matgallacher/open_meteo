// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastData _$ForecastDataFromJson(Map<String, dynamic> json) => ForecastData(
  time: json['time'] as String,
  interval: (json['interval'] as num).toInt(),
  temperature2M: (json['temperature_2m'] as num).toDouble(),
  isDay: _fromJsonToBool((json['is_day'] as num).toInt()),
  precipitation: (json['precipitation'] as num).toInt(),
);
