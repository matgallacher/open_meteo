import 'package:json_annotation/json_annotation.dart';

part 'hourly_detail_forecast_units.g.dart';

@JsonSerializable(createToJson: false)
class HourlyDetailForecastUnits {
  final String time;
  @JsonKey(name: 'temperature_2m')
  final String? temperature2M;
  @JsonKey(name: 'wind_speed_10m')
  final String windSpeed10M;
  @JsonKey(name: 'cloud_cover')
  final String cloudCover;
  final String visibility;
  @JsonKey(name: 'precipitation_probability')
  final String precipitationProbability;

  const HourlyDetailForecastUnits({
    required this.time,
    required this.temperature2M,
    required this.windSpeed10M,
    required this.cloudCover,
    required this.visibility,
    required this.precipitationProbability,
  });

  factory HourlyDetailForecastUnits.fromJson(Map<String, dynamic> json) =>
      _$HourlyDetailForecastUnitsFromJson(json);
}
