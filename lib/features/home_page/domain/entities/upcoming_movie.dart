import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:movies_api/core/utils/extensions/verify_null.dart';

class UpcomingMovie extends Equatable {
  final UpcomingDates? dates;
  final int? page;
  final List<UpcomingMovieResults>? results;
  final int? totalPages;
  final int? totalResults;

  const UpcomingMovie({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  @override
  List<Object?> get props => [
        dates.notNull(),
        page.notNull(),
        results.notNull(),
        totalPages.notNull(),
        totalResults.notNull(),
      ];
}

class UpcomingMovieResults extends Equatable {
  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final int? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  const UpcomingMovieResults({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory UpcomingMovieResults.fromMap(Map<String, dynamic> map) {
    return UpcomingMovieResults(
      id: map['id']?.toInt(),
      voteCount: map['vote_count']?.toInt(),
      video: map['video'],
      adult: map['adult'],
      voteAverage: map['vote_average']?.toDouble(),
      popularity: map['popularity']?.toDouble(),
      backdropPath: map['backdrop_path'],
      originalLanguage: map['original_language'],
      originalTitle: map['original_title'],
      overview: map['overview'],
      posterPath: map['poster_path'],
      releaseDate: map['release_date'],
      title: map['title'],
      genreIds: List<int>.from(map['genre_ids']),
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (voteCount != null) {
      result.addAll({'vote_count': voteCount});
    }
    if (video != null) {
      result.addAll({'video': video});
    }
    if (adult != null) {
      result.addAll({'adult': adult});
    }
    if (voteAverage != null) {
      result.addAll({'vote_average': voteAverage});
    }
    if (popularity != null) {
      result.addAll({'popularity': popularity});
    }
    if (backdropPath != null) {
      result.addAll({'backdrop_path': backdropPath});
    }
    if (originalLanguage != null) {
      result.addAll({'original_language': originalLanguage});
    }
    if (originalTitle != null) {
      result.addAll({'original_title': originalTitle});
    }
    if (overview != null) {
      result.addAll({'overview': overview});
    }
    if (posterPath != null) {
      result.addAll({'poster_path': posterPath});
    }
    if (releaseDate != null) {
      result.addAll({'release_date': releaseDate});
    }
    if (title != null) {
      result.addAll({'title': title});
    }
    if (genreIds != null) {
      result.addAll({'genre_ids': genreIds});
    }

    return result;
  }

  String toJson() => json.encode(toMap());

  factory UpcomingMovieResults.fromJson(String source) =>
      UpcomingMovieResults.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [
        id.notNull(),
        voteCount.notNull(),
        popularity.notNull(),
        voteAverage.notNull(),
        backdropPath.notNull(),
        title.notNull(),
        originalLanguage.notNull(),
        originalTitle.notNull(),
        overview.notNull(),
        posterPath.notNull(),
        releaseDate.notNull(),
        adult.notNull(),
        video.notNull(),
        genreIds.notNull(),
      ];
}

class UpcomingDates extends Equatable {
  final String? minimum;
  final String? maximum;

  const UpcomingDates({
    required this.minimum,
    required this.maximum,
  });

  factory UpcomingDates.fromMap(Map<String, dynamic> map) {
    return UpcomingDates(
      minimum: map['minimum'] ?? '',
      maximum: map['maximum'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (minimum != null) {
      result.addAll({'minimum': minimum});
    }

    if (maximum != null) {
      result.addAll({'maximum': maximum});
    }

    return result;
  }

  @override
  List<Object?> get props => [minimum.notNull(), maximum.notNull()];
}
