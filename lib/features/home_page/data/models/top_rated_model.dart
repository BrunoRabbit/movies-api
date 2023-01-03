import 'dart:convert';

import 'package:movies_api/features/home_page/domain/entities/top_rated.dart';

class TopRatedModel extends TopRated {
  const TopRatedModel({
    required int? page,
    required int? totalPages,
    required int? totalResults,
    required List<TopRatedDetails>? results,
  }) : super(
          page: page,
          results: results,
          totalPages: totalPages,
          totalResults: totalResults,
        );

  factory TopRatedModel.fromMap(Map<String, dynamic> map) {
    return TopRatedModel(
      page: map['page']?.toInt(),
      results: map['results'] != null
          ? List<TopRatedDetails>.from(
              map['results']?.map((x) => TopRatedDetails.fromMap(x)))
          : null,
      totalPages: map['totalPages']?.toInt(),
      totalResults: map['totalResults']?.toInt(),
    );
  }

  factory TopRatedModel.fromJson(String source) =>
      TopRatedModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (page != null) {
      result.addAll({'page': page});
    }
    if (results != null) {
      result.addAll({'results': results!.map((x) => x.toMap()).toList()});
    }
    if (totalPages != null) {
      result.addAll({'totalPages': totalPages});
    }
    if (totalResults != null) {
      result.addAll({'totalResults': totalResults});
    }

    return result;
  }

  String toJson() => json.encode(toMap());

  TopRatedModel wrapperFromJson(String source) =>
      TopRatedModel.fromJson(source);

  TopRatedModel wrapperFromMap(Map<String, dynamic> map) =>
      TopRatedModel.fromMap(map);
}
