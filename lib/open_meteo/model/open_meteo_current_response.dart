import 'package:json_annotation/json_annotation.dart';

class OpenMeteoCurrentResponse<U, D> {
  final double latitude;
  final double longitude;
  @JsonKey(name: 'generationtime_ms')
  final double generationtimeMs;
  @JsonKey(name: 'utc_offset_seconds')
  final int utcOffsetSeconds;
  final String timezone;
  @JsonKey(name: 'timezone_abbreviation')
  final String timezoneAbbreviation;
  final int elevation;
  @JsonKey(name: 'current_units')
  final U units;
  @JsonKey(name: 'current')
  final D data;

  const OpenMeteoCurrentResponse({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.units,
    required this.data,
  });
}
