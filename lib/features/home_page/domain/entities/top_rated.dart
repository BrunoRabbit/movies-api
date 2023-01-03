import 'dart:convert';

import 'package:equatable/equatable.dart';

class TopRated extends Equatable {
  final int? page;
  final List<TopRatedDetails>? results;
  final int? totalPages;
  final int? totalResults;

  const TopRated({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  @override
  List<Object?> get props => [
        if (page != null) page,
        if (totalPages != null) totalPages,
        if (totalResults != null) totalResults,
        if (results != null) results,
      ];
}

class TopRatedDetails {
  int? id;
  int? voteCount;
  bool? video;
  bool? adult;
  double? voteAverage;
  double? popularity;
  String? backdropPath;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;
  List<int>? genreIds;

  TopRatedDetails({
    required this.id,
    required this.voteCount,
    required this.video,
    required this.adult,
    required this.voteAverage,
    required this.popularity,
    required this.backdropPath,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.genreIds,
  });

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

  factory TopRatedDetails.fromMap(Map<String, dynamic> map) {
    return TopRatedDetails(
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

  String toJson() => json.encode(toMap());

  factory TopRatedDetails.fromJson(String source) =>
      TopRatedDetails.fromMap(json.decode(source));
}
