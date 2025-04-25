import 'package:json_annotation/json_annotation.dart';

part 'air_quality_units.g.dart';

@JsonSerializable(createToJson: false)
class AirQualityUnits {
  final String time;
  final String interval;
  @JsonKey(name: 'uv_index')
  final String uvIndex;
  @JsonKey(name: 'grass_pollen')
  final String grassPollen;
  final String pm10;

  const AirQualityUnits({
    required this.time,
    required this.interval,
    required this.uvIndex,
    required this.grassPollen,
    required this.pm10,
  });
  factory AirQualityUnits.fromJson(Map<String, dynamic> json) =>
      _$AirQualityUnitsFromJson(json);
}
