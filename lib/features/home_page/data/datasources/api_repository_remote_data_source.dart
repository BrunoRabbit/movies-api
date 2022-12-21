import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:movies_api/core/error/exceptions.dart';

import 'package:movies_api/features/home_page/data/models/config_model.dart';
import 'package:movies_api/features/home_page/data/models/movie_model.dart';
import 'package:movies_api/features/home_page/data/models/trending_model.dart';

abstract class ApiRepositoryRemoteDataSource {
  Future<ConfigModel> getConfigurationApi();
  Future<MovieModel> getPopularMovies();
  Future<TrendingModel> getTrendingApi();
}

class ApiRepositoryRemoteDataSourceImpl
    implements ApiRepositoryRemoteDataSource {
  final String key = dotenv.get("API_KEY");
  late http.Response response;

  @override
  Future<ConfigModel> getConfigurationApi() async {
    final String _url =
        'https://api.themoviedb.org/3/configuration?api_key=$key';

    response = await http.get(Uri.parse(_url));

    Map<String, dynamic> activity = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return ConfigModel.fromMap(activity);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MovieModel> getPopularMovies() async {
    final String _url =
        'https://api.themoviedb.org/3/movie/popular?api_key=$key&language=pt-BR&page=1';

    response = await http.get(Uri.parse(_url));

    Map<String, dynamic> activity = json.decode(response.body);

    if (response.statusCode == 200) {
      return MovieModel.fromMap(activity);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TrendingModel> getTrendingApi() async {
    final String _url =
        'https://api.themoviedb.org/3/trending/all/day?api_key=$key';

    response = await http.get(Uri.parse(_url));

    Map<String, dynamic> activity = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return TrendingModel.fromMap(activity);
    } else {
      throw ServerException();
    }
  }
}
