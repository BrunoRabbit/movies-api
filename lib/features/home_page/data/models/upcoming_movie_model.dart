import 'dart:convert';

import 'package:movies_api/features/home_page/domain/entities/upcoming_movie.dart';

class UpcomingMovieModel extends UpcomingMovie {
  const UpcomingMovieModel({
    required UpcomingDates super.dates,
    required int super.page,
    required List<UpcomingMovieResults> super.results,
    required int super.totalPages,
    required int super.totalResults,
  });

  factory UpcomingMovieModel.fromMap(Map<String, dynamic> map) {
    return UpcomingMovieModel(
      dates: UpcomingDates.fromMap(map['dates']),
      page: map['page']?.toInt(),
      results: List<UpcomingMovieResults>.from(
          map['results'].map((x) => UpcomingMovieResults.fromMap(x))),
      totalPages: map['total_pages']?.toInt(),
      totalResults: map['total_results']?.toInt(),
    );
  }

  factory UpcomingMovieModel.fromJson(String source) =>
      UpcomingMovieModel.fromMap(json.decode(source));

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

  UpcomingMovieModel wrapperFromMap(Map<String, dynamic> map) =>
      UpcomingMovieModel.fromMap(map);

  UpcomingMovieModel wrapperFromJson(String source) =>
      UpcomingMovieModel.fromJson(source);
}
