import 'dart:convert';

import 'package:movies_api/features/home_page/domain/entities/trending.dart';

class TrendingModel extends Trending {
  const TrendingModel({
    required int? page,
    required int? totalPages,
    required int? totalResults,
    required List<TrendingsDetails>? results,
  }) : super(
          page: page,
          results: results,
          totalPages: totalPages,
          totalResults: totalResults,
        );

  factory TrendingModel.fromMap(Map<String, dynamic> map) {
    return TrendingModel(
      page: map['page']?.toInt(),
      results: map['results'] != null
          ? List<TrendingsDetails>.from(
              map['results']?.map((x) => TrendingsDetails.fromMap(x)))
          : null,
      totalPages: map['totalPages']?.toInt(),
      totalResults: map['totalResults']?.toInt(),
    );
  }

  factory TrendingModel.fromJson(String source) =>
      TrendingModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (page != null) {
      result.addAll({'page': page});
    }
    if (results != null) {
      result.addAll({'results': results!.map((x) => x.toMap()).toList()});
    }
    if (totalPages != null) {
      result.addAll({'totalPages': totalPages});
    }
    if (totalResults != null) {
      result.addAll({'totalResults': totalResults});
    }

    return result;
  }

  String toJson() => json.encode(toMap());

  TrendingModel wrapperFromJson(String source) =>
      TrendingModel.fromJson(source);

  TrendingModel wrapperFromMap(Map<String, dynamic> map) =>
      TrendingModel.fromMap(map);
}
