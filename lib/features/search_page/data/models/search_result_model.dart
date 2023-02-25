import 'dart:convert';

import 'package:movies_api/features/search_page/domain/entities/search_result.dart';

class SearchResultModel extends SearchResult {
  const SearchResultModel({
    required int super.page,
    required List<SearchQueryResults> super.results,
    required int super.totalPages,
    required int super.totalResults,
  });

  factory SearchResultModel.fromMap(Map<String, dynamic> map) {
    return SearchResultModel(
      page: map['page']?.toInt(),
      results: List<SearchQueryResults>.from(
          map['results'].map((x) => SearchQueryResults.fromMap(x))),
      totalPages: map['total_pages']?.toInt(),
      totalResults: map['total_results']?.toInt(),
    );
  }

  factory SearchResultModel.fromJson(String source) =>
      SearchResultModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (page != null) {
      result.addAll({'page': page});
    }
    if (results != null) {
      result.addAll({'results': results!.map((x) => x.toMap()).toList()});
    }
    if (totalPages != null) {
      result.addAll({'total_pages': totalPages});
    }
    if (totalResults != null) {
      result.addAll({'total_results': totalResults});
    }

    return result;
  }
  String toJson() => json.encode(toMap());

  SearchResultModel wrapperFromMap(Map<String, dynamic> map) =>
      SearchResultModel.fromMap(map);

  SearchResultModel wrapperFromJson(String source) =>
      SearchResultModel.fromJson(source);
}
