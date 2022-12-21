import 'dart:convert';

import 'package:equatable/equatable.dart';

class Trending extends Equatable {
  final int? page;
  final int? totalPages;
  final int? totalResults;
  final List<TrendingsDetails>? results;

  const Trending({
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

class TrendingsDetails {
  int? id;
  int? voteCount;
  bool? adult;
  bool? video;
  double? voteAverage;
  double? popularity;
  String? backdropPath;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;
  String? firstAirDate;
  String? name;
  String? originalName;
  List<int>? genreIds;
  List<String>? originCountry;

  TrendingsDetails({
    required this.id,
    required this.voteCount,
    required this.adult,
    required this.video,
    required this.voteAverage,
    required this.popularity,
    required this.backdropPath,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.firstAirDate,
    required this.name,
    required this.originalName,
    required this.genreIds,
    required this.originCountry,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (voteCount != null) {
      result.addAll({'voteCount': voteCount});
    }
    if (adult != null) {
      result.addAll({'adult': adult});
    }
    if (video != null) {
      result.addAll({'video': video});
    }
    if (voteAverage != null) {
      result.addAll({'voteAverage': voteAverage});
    }
    if (popularity != null) {
      result.addAll({'popularity': popularity});
    }
    if (backdropPath != null) {
      result.addAll({'backdropPath': backdropPath});
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
    if (releaseDate != null) {
      result.addAll({'releaseDate': releaseDate});
    }
    if (title != null) {
      result.addAll({'title': title});
    }
    if (firstAirDate != null) {
      result.addAll({'firstAirDate': firstAirDate});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (originalName != null) {
      result.addAll({'originalName': originalName});
    }
    if (genreIds != null) {
      result.addAll({'genreIds': genreIds});
    }
    if (originCountry != null) {
      result.addAll({'originCountry': originCountry});
    }

    return result;
  }

  factory TrendingsDetails.fromMap(Map<String, dynamic> map) {
    return TrendingsDetails(
      id: map['id']?.toInt(),
      voteCount: map['voteCount']?.toInt(),
      adult: map['adult'],
      video: map['video'],
      voteAverage: map['voteAverage']?.toDouble(),
      popularity: map['popularity']?.toDouble(),
      backdropPath: map['backdropPath'],
      originalLanguage: map['originalLanguage'],
      originalTitle: map['originalTitle'],
      overview: map['overview'],
      posterPath: map['posterPath'],
      releaseDate: map['releaseDate'],
      title: map['title'],
      firstAirDate: map['firstAirDate'],
      name: map['name'],
      originalName: map['originalName'],
      genreIds: List<int>.from(map['genreIds']),
      originCountry: List<String>.from(map['originCountry']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TrendingsDetails.fromJson(String source) =>
      TrendingsDetails.fromMap(json.decode(source));
}
