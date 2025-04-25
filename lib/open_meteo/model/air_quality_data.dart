import 'package:json_annotation/json_annotation.dart';

part 'air_quality_data.g.dart';

@JsonSerializable(createToJson: false)
class AirQualityData {
  final String time;
  final int interval;
  @JsonKey(name: 'uv_index')
  final double uvIndex;
  @JsonKey(name: 'grass_pollen')
  final double? grassPollen;
  final double pm10;

  const AirQualityData({
    required this.time,
    required this.interval,
    required this.uvIndex,
    this.grassPollen,
    required this.pm10,
  });

  factory AirQualityData.fromJson(Map<String, dynamic> json) =>
      _$AirQualityDataFromJson(json);
}
