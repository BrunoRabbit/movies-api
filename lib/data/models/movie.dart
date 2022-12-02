import 'dart:convert';

import 'package:movies_api/data/models/results.dart';

//https://api.themoviedb.org/3/movie/550/recommendations?api_key=9ac406a66ef45207fe6d7dc478792ca4&language=en-US&page=1
class Movie {
  //? POPULAR MOVIE
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults; //? Usar como limite de uma lista, exemplo

  Movie({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

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

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      page: map['page']?.toInt(),
      results: map['results'] != null
          ? List<Results>.from(map['results']?.map((x) => Results.fromMap(x)))
          : null,
      totalPages: map['totalPages']?.toInt(),
      totalResults: map['totalResults']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));
}
