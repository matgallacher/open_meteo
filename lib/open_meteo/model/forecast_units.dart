import 'package:json_annotation/json_annotation.dart';

part 'forecast_units.g.dart';

@JsonSerializable(createToJson: false)
class ForecastUnits {
  final String time;
  final String interval;
  @JsonKey(name: 'temperature_2m')
  final String temperature2M;
  final String precipitation;

  const ForecastUnits({
    required this.time,
    required this.interval,
    required this.temperature2M,
    required this.precipitation,
  });

  factory ForecastUnits.fromJson(Map<String, dynamic> json) =>
      _$ForecastUnitsFromJson(json);
}
