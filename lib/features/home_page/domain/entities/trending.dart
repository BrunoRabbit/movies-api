// ignore_for_file: must_be_immutable

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

  // factory Trending.fromJson(Map<String, dynamic> json) => Trending(
  //       page: json["page"],
  //       results: List<TrendingsDetails>.from(
  //           json["results"].map((x) => TrendingsDetails.fromJson(x))),
  //       totalPages: json["total_pages"],
  //       totalResults: json["total_results"],
  //     );

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['page'] = page;
  //   if (results != null) {
  //     data['results'] = results!.map((e) => e.toJson());
  //   }
  //   data['totalPages'] = totalPages;
  //   data['totalResults'] = totalResults;
  //   return data;
  // }

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
    this.id,
    this.voteCount,
    this.adult,
    this.video,
    this.voteAverage,
    this.popularity,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.firstAirDate,
    this.name,
    this.originalName,
    this.genreIds,
    this.originCountry,
  });

  factory TrendingsDetails.fromJson(Map<String, dynamic> json) =>
      TrendingsDetails(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
        popularity: json["popularity"].toDouble(),
        firstAirDate: json["first_air_date"],
        name: json["name"],
        originCountry: json["origin_country"] == null
            ? null
            : List<String>.from(json["origin_country"].map((x) => x)),
        originalName: json["original_name"],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['genre_ids'] = genreIds;
    data['id'] = id;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['title'] = title;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    data['popularity'] = popularity;
    data['first_air_date'] = firstAirDate;
    data['name'] = name;
    data['origin_country'] = originCountry;
    data['original_name'] = originalName;
    return data;
  }
}
