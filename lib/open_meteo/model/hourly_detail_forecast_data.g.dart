// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_detail_forecast_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourlyDetailForecastData _$HourlyDetailForecastDataFromJson(
  Map<String, dynamic> json,
) => HourlyDetailForecastData(
  time:
      (json['time'] as List<dynamic>)
          .map((e) => DateTime.parse(e as String))
          .toList(),
  temperature2M:
      (json['temperature_2m'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
  windSpeed10M:
      (json['wind_speed_10m'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
  cloudCover:
      (json['cloud_cover'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
  visibility:
      (json['visibility'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
  precipitationProbability:
      (json['precipitation_probability'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
  isDay:
      (json['is_day'] as List<dynamic>).map((e) => (e as num).toInt()).toList(),
);
