import 'package:json_annotation/json_annotation.dart';

part 'search_result.g.dart';

@JsonSerializable(createToJson: false)
class SearchResult {
  final int id;
  final String name;
  final double latitude;
  final double longitude;
  final int? elevation;
  @JsonKey(name: 'feature_code')
  final String featureCode;
  @JsonKey(name: 'country_code')
  final String countryCode;
  final String timezone;
  final int? population;
  @JsonKey(name: 'country_id')
  final int? countryId;
  final String country;
  final String admin1;
  final String admin2;
  final String admin3;
  final String admin4;

  const SearchResult({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    this.elevation,
    required this.featureCode,
    required this.countryCode,
    required this.timezone,
    this.population,
    this.countryId,
    required this.country,
    this.admin1 = '',
    this.admin2 = '',
    this.admin3 = '',
    this.admin4 = '',
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) =>
      _$SearchResultFromJson(json);
}
