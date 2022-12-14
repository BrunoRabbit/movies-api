import 'package:movies_api/app/data/models/trendings_details.dart';

class Trending {
  int? page;
  List<TrendingsDetails>? results;
  int? totalPages;
  int? totalResults;

  Trending({this.page, this.results, this.totalPages, this.totalResults});

  factory Trending.fromJson(Map<String, dynamic> json) => Trending(
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
