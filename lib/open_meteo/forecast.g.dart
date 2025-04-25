// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Forecast _$ForecastFromJson(Map<String, dynamic> json) => Forecast(
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  generationtimeMs: (json['generationtime_ms'] as num).toDouble(),
  utcOffsetSeconds: (json['utc_offset_seconds'] as num).toInt(),
  timezone: json['timezone'] as String,
  timezoneAbbreviation: json['timezone_abbreviation'] as String,
  elevation: (json['elevation'] as num).toInt(),
  units: ForecastUnits.fromJson(json['current_units'] as Map<String, dynamic>),
  data: ForecastData.fromJson(json['current'] as Map<String, dynamic>),
);
