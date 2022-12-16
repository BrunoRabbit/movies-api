// ignore_for_file: must_be_immutable

import 'dart:convert';

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

  // Map<String, dynamic> toMap() {
  //   final result = <String, dynamic>{};

  //   if (page != null) {
  //     result.addAll({'page': page});
  //   }
  //   if (results != null) {
  //     result.addAll({'results': results!.map((x) => x.toMap()).toList()});
  //   }
  //   if (totalPages != null) {
  //     result.addAll({'totalPages': totalPages});
  //   }
  //   if (totalResults != null) {
  //     result.addAll({'totalResults': totalResults});
  //   }

  //   return result;
  // }

  // factory Movie.fromMap(Map<String, dynamic> map) {
  //   return Movie(
  //     page: map['page']?.toInt(),
  //     results: map['results'] != null
  //         ? List<Results>.from(map['results']?.map((x) => Results.fromMap(x)))
  //         : null,
  //     totalPages: map['totalPages']?.toInt(),
  //     totalResults: map['totalResults']?.toInt(),
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        if (page != null) page,
        if (totalPages != null) totalPages,
        if (totalResults != null) totalResults,
        if (results != null) results,
      ];
}

class Results {
  bool? adult;
  String? backdropPath;
  int? id;
  String? title;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? mediaType;
  List<int>? genreIds;
  double? popularity;
  String? releaseDate;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Results({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (adult != null) {
      result.addAll({'adult': adult});
    }
    if (backdropPath != null) {
      result.addAll({'backdropPath': backdropPath});
    }
    if (id != null) {
      result.addAll({'id': id});
    }
    if (title != null) {
      result.addAll({'title': title});
    }
    if (originalLanguage != null) {
      result.addAll({'originalLanguage': originalLanguage});
    }
    if (originalTitle != null) {
      result.addAll({'originalTitle': originalTitle});
    }
    if (overview != null) {
      result.addAll({'overview': overview});
    }
    if (posterPath != null) {
      result.addAll({'posterPath': posterPath});
    }
    if (mediaType != null) {
      result.addAll({'mediaType': mediaType});
    }
    if (genreIds != null) {
      result.addAll({'genreIds': genreIds});
    }
    if (popularity != null) {
      result.addAll({'popularity': popularity});
    }
    if (releaseDate != null) {
      result.addAll({'releaseDate': releaseDate});
    }
    if (video != null) {
      result.addAll({'video': video});
    }
    if (voteAverage != null) {
      result.addAll({'voteAverage': voteAverage});
    }
    if (voteCount != null) {
      result.addAll({'voteCount': voteCount});
    }

    return result;
  }

  factory Results.fromMap(Map<String, dynamic> map) {
    return Results(
      adult: map['adult'] ?? false,
      backdropPath: map['backdropPath'] ?? '' ?? '',
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      originalLanguage: map['originalLanguage'] ?? '',
      originalTitle: map['originalTitle'] ?? '',
      overview: map['overview'] ?? '',
      posterPath: map['posterPath'] ?? '',
      mediaType: map['mediaType'] ?? '',
      genreIds: map['genreIds'] != null
          ? List<int>.from(map['genreIds'])
          : [], // TODO- POSSIVEL CHANGE
      // genreIds: List<int>.from(map['genreIds']) ?? [],
      popularity: map['popularity']?.toDouble() ?? 0.0,
      releaseDate: map['releaseDate'] ?? '',
      video: map['video'] ?? false,
      voteAverage: map['voteAverage']?.toDouble() ?? 0.0,
      voteCount: map['voteCount']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Results.fromJson(String source) =>
      Results.fromMap(json.decode(source));
}
