import 'dart:convert';

import 'package:http/http.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_meteo/open_meteo/forecast.dart';
import 'package:open_meteo/open_meteo/model/daily_detail_forecast_data.dart';
import 'package:open_meteo/open_meteo/model/daily_detail_forecast_units.dart';

part 'daily_forecast.g.dart';

@JsonSerializable(createToJson: false)
class DailyForecast {
  final double latitude;
  final double longitude;
  @JsonKey(name: 'generationtime_ms')
  final double generationtimeMs;
  @JsonKey(name: 'utc_offset_seconds')
  final int utcOffsetSeconds;
  final String timezone;
  @JsonKey(name: 'timezone_abbreviation')
  final String timezoneAbbreviation;
  final int elevation;
  @JsonKey(name: 'daily_units')
  final DailyDetailForecastUnits units;
  @JsonKey(name: 'daily')
  final DailyDetailForecastData data;

  const DailyForecast({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.units,
    required this.data,
  });

  factory DailyForecast.fromJson(Map<String, dynamic> json) =>
      _$DailyForecastFromJson(json);

  static Future<DailyForecast> fetch(double latitude, double longitude) async {
    final url = Uri.parse(
      '${Forecast.baseUrl}?latitude=$latitude&longitude=$longitude'
      '&daily=temperature_2m_max,wind_speed_10m_max,cloud_cover_mean,visibility_mean,precipitation_probability_max',
    );
    final response = await get(url);
    if (response.statusCode == 200) {
      return DailyForecast.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load daily forecast data');
    }
  }
}
