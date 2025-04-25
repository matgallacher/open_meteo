// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Search _$SearchFromJson(Map<String, dynamic> json) => Search._(
  generationtimeMs: (json['generationtime_ms'] as num).toDouble(),
  results:
      (json['results'] as List<dynamic>?)
          ?.map((e) => SearchResult.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);
