import 'dart:convert';

import 'package:http/http.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_meteo/open_meteo/model/search_result.dart';

part 'search.g.dart';

@JsonSerializable(constructor: '_', createToJson: false)
class Search {
  static const baseUrl = 'https://geocoding-api.open-meteo.com/v1/search';

  final List<SearchResult> results;
  @JsonKey(name: 'generationtime_ms')
  final double generationtimeMs;

  Search._({required this.generationtimeMs, this.results = const []});

  factory Search._fromJson(Map<String, dynamic> json) => _$SearchFromJson(json);

  static Future<List<SearchResult>> fetch(String name) async {
    final url = Uri.parse('$baseUrl?name=$name');
    final response = await get(url);
    if (response.statusCode == 200) {
      return Search._fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('Failed to load search results');
    }
  }
}
