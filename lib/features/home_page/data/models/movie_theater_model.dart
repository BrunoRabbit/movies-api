import 'dart:convert';

import 'package:movies_api/features/home_page/domain/entities/movie_theater.dart';

class MovieTheaterModel extends MovieTheater {
  const MovieTheaterModel({
    required Dates super.dates,
    required int super.page,
    required List<MovieTheaterResults> super.results,
    required int super.totalPages,
    required int super.totalResults,
  });

  factory MovieTheaterModel.fromMap(Map<String, dynamic> map) {
    return MovieTheaterModel(
      dates: Dates.fromMap(map['dates']),
      page: map['page']?.toInt(),
      results: List<MovieTheaterResults>.from(
          map['results'].map((x) => MovieTheaterResults.fromMap(x))),
      totalPages: map['total_pages']?.toInt(),
      totalResults: map['total_results']?.toInt(),
    );
  }

  factory MovieTheaterModel.fromJson(String source) =>
      MovieTheaterModel.fromMap(json.decode(source));

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

  MovieTheaterModel wrapperFromMap(Map<String, dynamic> map) =>
      MovieTheaterModel.fromMap(map);

  MovieTheaterModel wrapperFromJson(String source) =>
      MovieTheaterModel.fromJson(source);
}
