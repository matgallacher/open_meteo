import 'package:json_annotation/json_annotation.dart';

part 'daily_detail_forecast_data.g.dart';

@JsonSerializable(createToJson: false)
class DailyDetailForecastData {
  final List<DateTime> time;
  @JsonKey(name: 'temperature_2m_max')
  final List<double> temperature2MMax;
  @JsonKey(name: 'wind_speed_10m_max')
  final List<double> windSpeed10MMax;
  @JsonKey(name: 'cloud_cover_mean')
  final List<int> cloudCoverMean;
  @JsonKey(name: 'visibility_mean')
  final List<double> visibilityMean;
  @JsonKey(name: 'precipitation_probability_max')
  final List<int> precipitationProbabilityMax;

  const DailyDetailForecastData({
    required this.time,
    required this.temperature2MMax,
    required this.windSpeed10MMax,
    required this.cloudCoverMean,
    required this.visibilityMean,
    required this.precipitationProbabilityMax,
  });

  factory DailyDetailForecastData.fromJson(Map<String, dynamic> json) =>
      _$DailyDetailForecastDataFromJson(json);
}
