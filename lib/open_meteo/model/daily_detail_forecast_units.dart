import 'package:json_annotation/json_annotation.dart';

part 'daily_detail_forecast_units.g.dart';

@JsonSerializable(createToJson: false)
class DailyDetailForecastUnits {
  final String time;
  @JsonKey(name: 'temperature_2m_max')
  final String? temperature2MMax;
  @JsonKey(name: 'wind_speed_10m_max')
  final String windSpeed10MMax;
  @JsonKey(name: 'cloud_cover_mean')
  final String cloudCoverMean;
  @JsonKey(name: 'visibility_mean')
  final String visibilityMean;
  @JsonKey(name: 'precipitation_probability_max')
  final String precipitationProbabilityMax;

  const DailyDetailForecastUnits({
    required this.time,
    required this.temperature2MMax,
    required this.windSpeed10MMax,
    required this.cloudCoverMean,
    required this.visibilityMean,
    required this.precipitationProbabilityMax,
  });

  factory DailyDetailForecastUnits.fromJson(Map<String, dynamic> json) =>
      _$DailyDetailForecastUnitsFromJson(json);
}
