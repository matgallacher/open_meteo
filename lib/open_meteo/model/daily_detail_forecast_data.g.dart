// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_detail_forecast_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyDetailForecastData _$DailyDetailForecastDataFromJson(
  Map<String, dynamic> json,
) => DailyDetailForecastData(
  time:
      (json['time'] as List<dynamic>)
          .map((e) => DateTime.parse(e as String))
          .toList(),
  temperature2MMax:
      (json['temperature_2m_max'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
  windSpeed10MMax:
      (json['wind_speed_10m_max'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
  cloudCoverMean:
      (json['cloud_cover_mean'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
  visibilityMean:
      (json['visibility_mean'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
  precipitationProbabilityMax:
      (json['precipitation_probability_max'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
);
