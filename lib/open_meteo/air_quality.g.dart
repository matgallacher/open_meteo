// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_quality.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirQuality _$AirQualityFromJson(Map<String, dynamic> json) => AirQuality(
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  generationtimeMs: (json['generationtime_ms'] as num).toDouble(),
  utcOffsetSeconds: (json['utc_offset_seconds'] as num).toInt(),
  elevation: (json['elevation'] as num).toInt(),
  timezone: json['timezone'] as String,
  timezoneAbbreviation: json['timezone_abbreviation'] as String,
  units: AirQualityUnits.fromJson(
    json['current_units'] as Map<String, dynamic>,
  ),
  data: AirQualityData.fromJson(json['current'] as Map<String, dynamic>),
);
