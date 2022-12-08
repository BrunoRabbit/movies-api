import 'package:movies_api/data/models/trendings_details.dart';

class Trending {
  int? page;
  List<TrendingsDetails>? results;
  int? totalPages;
  int? totalResults;

  Trending({this.page, this.results, this.totalPages, this.totalResults});

  Trending.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <TrendingsDetails>[];
      json['results'].forEach((v) {
        results!.add(TrendingsDetails.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}
