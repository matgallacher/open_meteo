import 'package:json_annotation/json_annotation.dart';

part 'forecast_data.g.dart';

@JsonSerializable(createToJson: false)
class ForecastData {
  final String time;
  final int interval;
  @JsonKey(name: 'temperature_2m')
  final double temperature2M;
  @JsonKey(name: 'is_day', fromJson: _fromJsonToBool)
  final bool isDay;
  final int precipitation;

  const ForecastData({
    required this.time,
    required this.interval,
    required this.temperature2M,
    required this.isDay,
    required this.precipitation,
  });

  factory ForecastData.fromJson(Map<String, dynamic> json) =>
      _$ForecastDataFromJson(json);
}

bool _fromJsonToBool(int value) {
  return value == 1;
}
