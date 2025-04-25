// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResult _$SearchResultFromJson(Map<String, dynamic> json) => SearchResult(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  elevation: (json['elevation'] as num?)?.toInt(),
  featureCode: json['feature_code'] as String,
  countryCode: json['country_code'] as String,
  timezone: json['timezone'] as String,
  population: (json['population'] as num?)?.toInt(),
  countryId: (json['country_id'] as num?)?.toInt(),
  country: json['country'] as String,
  admin1: json['admin1'] as String? ?? '',
  admin2: json['admin2'] as String? ?? '',
  admin3: json['admin3'] as String? ?? '',
  admin4: json['admin4'] as String? ?? '',
);
