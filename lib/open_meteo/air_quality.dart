import 'dart:convert';

import 'package:http/http.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_meteo/open_meteo/model/air_quality_data.dart';
import 'package:open_meteo/open_meteo/model/air_quality_units.dart';
import 'package:open_meteo/open_meteo/model/open_meteo_current_response.dart';

part 'air_quality.g.dart';

@JsonSerializable(createToJson: false)
class AirQuality
    extends OpenMeteoCurrentResponse<AirQualityUnits, AirQualityData> {
  static const baseUrl =
      'https://air-quality-api.open-meteo.com/v1/air-quality';

  const AirQuality({
    required super.latitude,
    required super.longitude,
    required super.generationtimeMs,
    required super.utcOffsetSeconds,
    required super.elevation,
    required super.timezone,
    required super.timezoneAbbreviation,
    required super.units,
    required super.data,
  });

  factory AirQuality.fromJson(Map<String, dynamic> json) =>
      _$AirQualityFromJson(json);

  static Future<AirQuality> fetch(double lat, double lon) async {
    final url = Uri.parse(
      '$baseUrl?latitude=$lat&longitude=$lon&current=uv_index,grass_pollen,pm10',
    );
    final response = await get(url);
    if (response.statusCode == 200) {
      return AirQuality.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load air quality data');
    }
  }
}
