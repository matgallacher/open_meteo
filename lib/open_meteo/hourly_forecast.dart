import 'dart:convert';

import 'package:http/http.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_meteo/open_meteo/forecast.dart';
import 'package:open_meteo/open_meteo/model/hourly_detail_forecast_data.dart';
import 'package:open_meteo/open_meteo/model/hourly_detail_forecast_units.dart';

part 'hourly_forecast.g.dart';

@JsonSerializable(createToJson: false)
class HourlyForecast {
  static const baseUrl = 'https://api.open-meteo.com/v1/forecast';

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
  @JsonKey(name: 'hourly_units')
  final HourlyDetailForecastUnits units;
  @JsonKey(name: 'hourly')
  final HourlyDetailForecastData data;

  const HourlyForecast({
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

  factory HourlyForecast.fromJson(Map<String, dynamic> json) =>
      _$HourlyForecastFromJson(json);

  static Future<HourlyForecast> fetch(double latitude, double longitude) async {
    final url = Uri.parse(
      '${Forecast.baseUrl}?latitude=$latitude&longitude=$longitude'
      '&hourly=temperature_2m,precipitation_probability,cloud_cover,visibility,wind_speed_10m,is_day&forecast_days=1',
    );
    final response = await get(url);
    if (response.statusCode == 200) {
      return HourlyForecast.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load daily forecast data');
    }
  }
}
