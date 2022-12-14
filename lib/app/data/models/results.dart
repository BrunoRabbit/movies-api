import 'dart:convert';

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

  // Results.fromJson(Map<String, dynamic> json) {
  //   adult = json['adult'];
  //   backdropPath = json['backdrop_path'];
  //   id = json['id'];
  //   title = json['title'];
  //   originalLanguage = json['original_language'];
  //   originalTitle = json['original_title'];
  //   overview = json['overview'];
  //   posterPath = json['poster_path'];
  //   mediaType = json['media_type'];
  //   genreIds = json['genre_ids'].cast<int>();
  //   popularity = json['popularity'];
  //   releaseDate = json['release_date'];
  //   video = json['video'];
  //   voteAverage = json['vote_average'];
  //   voteCount = json['vote_count'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['adult'] = adult;
  //   data['backdrop_path'] = backdropPath;
  //   data['id'] = id;
  //   data['title'] = title;
  //   data['original_language'] = originalLanguage;
  //   data['original_title'] = originalTitle;
  //   data['overview'] = overview;
  //   data['poster_path'] = posterPath;
  //   data['media_type'] = mediaType;
  //   data['genre_ids'] = genreIds;
  //   data['popularity'] = popularity;
  //   data['release_date'] = releaseDate;
  //   data['video'] = video;
  //   data['vote_average'] = voteAverage;
  //   data['vote_count'] = voteCount;
  //   return data;
  // }

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
