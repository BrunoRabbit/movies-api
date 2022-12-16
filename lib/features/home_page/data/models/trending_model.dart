// ignore_for_file: must_be_immutable

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

  factory TrendingModel.fromJson(Map<String, dynamic> json) => TrendingModel(
        page: json["page"],
        results: List<TrendingsDetails>.from(
            json["results"].map((x) => TrendingsDetails.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    if (results != null) {
      data['results'] = results!.map((e) => e.toJson());
    }
    data['totalPages'] = totalPages;
    data['totalResults'] = totalResults;
    return data;
  }
}
