// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyForecast _$DailyForecastFromJson(Map<String, dynamic> json) =>
    DailyForecast(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      generationtimeMs: (json['generationtime_ms'] as num).toDouble(),
      utcOffsetSeconds: (json['utc_offset_seconds'] as num).toInt(),
      timezone: json['timezone'] as String,
      timezoneAbbreviation: json['timezone_abbreviation'] as String,
      elevation: (json['elevation'] as num).toInt(),
      units: DailyDetailForecastUnits.fromJson(
        json['daily_units'] as Map<String, dynamic>,
      ),
      data: DailyDetailForecastData.fromJson(
        json['daily'] as Map<String, dynamic>,
      ),
    );
