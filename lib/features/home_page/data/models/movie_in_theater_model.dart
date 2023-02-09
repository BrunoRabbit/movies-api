import 'dart:convert';

import 'package:movies_api/features/home_page/domain/entities/movie_in_theater.dart';

class MovieInTheaterModel extends MovieInTheater {
  const MovieInTheaterModel({
    required Dates super.dates,
    required int super.page,
    required List<MovieInTheaterResults> super.results,
    required int super.totalPages,
    required int super.totalResults,
  });

  factory MovieInTheaterModel.fromMap(Map<String, dynamic> map) {
    return MovieInTheaterModel(
      dates: Dates.fromMap(map['dates']),
      page: map['page']?.toInt(),
      results: List<MovieInTheaterResults>.from(
          map['results'].map((x) => MovieInTheaterResults.fromMap(x))),
      totalPages: map['total_pages']?.toInt(),
      totalResults: map['total_results']?.toInt(),
    );
  }

  factory MovieInTheaterModel.fromJson(String source) =>
      MovieInTheaterModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (dates != null) {
      result.addAll({'dates': dates});
    }

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

  MovieInTheaterModel wrapperFromMap(Map<String, dynamic> map) =>
      MovieInTheaterModel.fromMap(map);

  MovieInTheaterModel wrapperFromJson(String source) =>
      MovieInTheaterModel.fromJson(source);
}
