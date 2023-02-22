import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies_api/core/error/exceptions.dart';
import 'package:movies_api/features/search_page/data/models/search_result_model.dart';

abstract class SearchRemoteDatasources {
  Future<SearchResultModel> getSearchQuery(String name);
}

class SearchRemoteDatasourcesImpl implements SearchRemoteDatasources {
  final String key = dotenv.get("API_KEY");
  late http.Response response;

  @override
  Future<SearchResultModel> getSearchQuery(String name) async {
    final String _baseUrl = dotenv.get("URL_SEARCH_QUERY");
    final String _url = _baseUrl + key + "&query=" + _concatenateName(name);

    response = await http.get(Uri.parse(_url));

    Map<String, dynamic> activity = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return SearchResultModel.fromMap(activity);
    } else {
      throw ServerException();
    }
  }

  static String _concatenateName(String name) => name.split(' ').join('+');
}
