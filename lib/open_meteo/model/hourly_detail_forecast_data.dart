import 'package:json_annotation/json_annotation.dart';

part 'hourly_detail_forecast_data.g.dart';

@JsonSerializable(createToJson: false)
class HourlyDetailForecastData {
  final List<DateTime> time;
  @JsonKey(name: 'temperature_2m')
  final List<double> temperature2M;
  @JsonKey(name: 'wind_speed_10m')
  final List<double> windSpeed10M;
  @JsonKey(name: 'cloud_cover')
  final List<int> cloudCover;
  @JsonKey(name: 'visibility')
  final List<double> visibility;
  @JsonKey(name: 'precipitation_probability')
  final List<int> precipitationProbability;
  @JsonKey(name: 'is_day')
  final List<int> isDay;

  const HourlyDetailForecastData({
    required this.time,
    required this.temperature2M,
    required this.windSpeed10M,
    required this.cloudCover,
    required this.visibility,
    required this.precipitationProbability,
    required this.isDay,
  });

  factory HourlyDetailForecastData.fromJson(Map<String, dynamic> json) =>
      _$HourlyDetailForecastDataFromJson(json);
}
