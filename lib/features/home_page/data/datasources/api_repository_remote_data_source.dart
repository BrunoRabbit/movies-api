import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:movies_api/core/error/exceptions.dart';

import 'package:movies_api/features/home_page/data/models/config_model.dart';
import 'package:movies_api/features/home_page/data/models/movie_model.dart';
import 'package:movies_api/features/home_page/data/models/movie_in_theater_model.dart';
import 'package:movies_api/features/home_page/data/models/top_rated_model.dart';
import 'package:movies_api/features/home_page/data/models/trending_model.dart';
import 'package:movies_api/features/home_page/data/models/upcoming_movie_model.dart';

abstract class ApiRepositoryRemoteDataSource {
  Future<ConfigModel> getConfigurationApi();
  Future<MovieModel> getPopularMovies();
  Future<TrendingModel> getTrendingApi();
  Future<TopRatedModel> getTopRatedApi();
  Future<MovieInTheaterModel> getMoviesInTheaters();
  Future<UpcomingMovieModel> getUpcomingApi();
}

class ApiRepositoryRemoteDataSourceImpl
    implements ApiRepositoryRemoteDataSource {
  final String key = dotenv.get("API_KEY");
  late http.Response response;

  @override
  Future<ConfigModel> getConfigurationApi() async {
    final String url = dotenv.get("URL_CONFIG");

    final String _url = url + key;

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
    final String url = dotenv.get("URL_MOVIE");
    final String _url = '$url$key&language=pt-BR&page=1';

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
    final String url = dotenv.get("URL_TRENDING");
    final String _url = '$url$key&language=pt-BR&page=1';

    response = await http.get(Uri.parse(_url));

    Map<String, dynamic> activity = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return TrendingModel.fromMap(activity);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TopRatedModel> getTopRatedApi() async {
    final String url = dotenv.get("URL_TOP_RATING");
    final String _url = '$url$key';

    response = await http.get(Uri.parse(_url));

    Map<String, dynamic> activity = json.decode(response.body);

    if (response.statusCode == 200) {
      return TopRatedModel.fromMap(activity);
    } else {
      throw ServerException();
    }
  }
  
  @override
  Future<MovieInTheaterModel> getMoviesInTheaters() async {
    final String url = dotenv.get("URL_NOW_PLAYING");
    final String _url = '$url$key';

    response = await http.get(Uri.parse(_url));

    Map<String, dynamic> activity = json.decode(response.body);

    if (response.statusCode == 200) {
      return MovieInTheaterModel.fromMap(activity);
    } else {
      throw ServerException();
    }
  }
  
  @override
  Future<UpcomingMovieModel> getUpcomingApi() async {
    final String url = dotenv.get("URL_UPCOMING");
    final String _url = '$url$key';

    response = await http.get(Uri.parse(_url));

    Map<String, dynamic> activity = json.decode(response.body);

    if (response.statusCode == 200) {
      return UpcomingMovieModel.fromMap(activity);
    } else {
      throw ServerException();
    }
  }
}
