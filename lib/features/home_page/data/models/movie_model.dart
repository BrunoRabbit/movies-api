import 'dart:convert';

import 'package:movies_api/features/home_page/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required int? page,
    required int? totalPages,
    required int? totalResults,
    required List<Results>? results,
  }) : super(
          page: page,
          results: results,
          totalPages: totalPages,
          totalResults: totalResults,
        );

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      page: map['page']?.toInt(),
      results: map['results'] != null
          ? List<Results>.from(map['results']?.map((x) => Results.fromMap(x)))
          : null,
      totalPages: map['totalPages']?.toInt(),
      totalResults: map['totalResults']?.toInt(),
    );
  }

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source));

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

  MovieModel wrapperFromMap(Map<String, dynamic> map) =>
      MovieModel.fromMap(map);

  MovieModel wrapperFromJson(String source) => MovieModel.fromJson(source);
}
