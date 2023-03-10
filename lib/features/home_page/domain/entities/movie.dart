import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  //? POPULAR MOVIE
  final int? page;
  final int? totalPages;
  final int? totalResults;
  final List<Results>? results;

  const Movie({
    required this.page,
    required this.totalPages,
    required this.totalResults,
    required this.results,
  });

  @override
  List<Object?> get props => [
        if (page != null) page,
        if (totalPages != null) totalPages,
        if (totalResults != null) totalResults,
        if (results != null) results,
      ];
}

class Results extends Equatable {
  final int? id;
  final int? voteCount;
  final double? popularity;
  final double? voteAverage;
  final String? backdropPath;
  final String? title;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final String? posterPath;
  final String? mediaType;
  final String? releaseDate;
  final bool? adult;
  final bool? video;
  final List<int>? genreIds;

  const Results({
    required this.id,
    required this.voteCount,
    required this.popularity,
    required this.voteAverage,
    required this.backdropPath,
    required this.title,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.releaseDate,
    required this.adult,
    required this.video,
    required this.genreIds,
  });

  factory Results.fromMap(Map<String, dynamic> map) {
    return Results(
      adult: map['adult'] ?? false,
      backdropPath: map['backdrop_path'] ?? '' ?? '',
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      originalLanguage: map['original_language'] ?? '',
      originalTitle: map['original_title'] ?? '',
      overview: map['overview'] ?? '',
      posterPath: map['poster_path'] ?? '',
      mediaType: map['media_type'] ?? '',
      genreIds: map['genre_ids'] != null
          ? List<int>.from(map['genre_ids'])
          : [],
      popularity: map['popularity']?.toDouble() ?? 0.0,
      releaseDate: map['release_date'] ?? '',
      video: map['video'] ?? false,
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
      voteCount: map['vote_count']?.toInt() ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (adult != null) {
      result.addAll({'adult': adult});
    }
    if (backdropPath != null) {
      result.addAll({'backdrop_path': backdropPath});
    }
    if (id != null) {
      result.addAll({'id': id});
    }
    if (title != null) {
      result.addAll({'title': title});
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
    if (mediaType != null) {
      result.addAll({'media_type': mediaType});
    }
    if (genreIds != null) {
      result.addAll({'genre_ids': genreIds});
    }
    if (popularity != null) {
      result.addAll({'popularity': popularity});
    }
    if (releaseDate != null) {
      result.addAll({'release_date': releaseDate});
    }
    if (video != null) {
      result.addAll({'video': video});
    }
    if (voteAverage != null) {
      result.addAll({'vote_average': voteAverage});
    }
    if (voteCount != null) {
      result.addAll({'vote_count': voteCount});
    }

    return result;
  }

  @override
  List<Object?> get props => [
        if (id != null) id,
        if (voteCount != null) voteCount,
        if (popularity != null) popularity,
        if (voteAverage != null) voteAverage,
        if (backdropPath != null) backdropPath,
        if (title != null) title,
        if (originalLanguage != null) originalLanguage,
        if (originalTitle != null) originalTitle,
        if (overview != null) overview,
        if (posterPath != null) posterPath,
        if (mediaType != null) mediaType,
        if (releaseDate != null) releaseDate,
        if (adult != null) adult,
        if (video != null) video,
        if (genreIds != null) genreIds,
      ];
}
