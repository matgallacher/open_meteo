import 'dart:convert';

import 'package:http/http.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_meteo/open_meteo/model/forecast_data.dart';
import 'package:open_meteo/open_meteo/model/forecast_units.dart';
import 'package:open_meteo/open_meteo/model/open_meteo_current_response.dart';

part 'forecast.g.dart';

@JsonSerializable(createToJson: false)
class Forecast extends OpenMeteoCurrentResponse<ForecastUnits, ForecastData> {
  static const baseUrl = 'https://api.open-meteo.com/v1/forecast';

  Forecast({
    required super.latitude,
    required super.longitude,
    required super.generationtimeMs,
    required super.utcOffsetSeconds,
    required super.timezone,
    required super.timezoneAbbreviation,
    required super.elevation,
    required super.units,
    required super.data,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  static Future<Forecast> fetch(double lat, double lon) async {
    final url = Uri.parse(
      '$baseUrl?latitude=$lat&longitude=$lon&current=temperature_2m,is_day,precipitation',
    );
    final response = await get(url);
    if (response.statusCode == 200) {
      return Forecast.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load forecast');
    }
  }
}
