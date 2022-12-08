import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:movies_api/core/utils/use_case.dart';
import 'package:movies_api/data/models/config.dart';
import 'package:movies_api/data/models/movie.dart';

import 'package:movies_api/data/repositories/api_repository.dart';

class ApiRepositoryImpl implements ApiRepository {
  final String key = dotenv.get("apiKey");

  @override
  Future<Either<NoParams, Config>> getConfigurationApi() async {
    //? https://developers.themoviedb.org/3/configuration/get-api-configuration

    try {
      http.Response response;
      final String _url =
          'https://api.themoviedb.org/3/configuration?api_key=$key';

      response = await http.get(Uri.parse(_url));

      Map<String, dynamic> activity = jsonDecode(response.body);

      return Right(Config.fromJson(activity));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<NoParams, Movie>> getPopularMovies() async {
    try {
      http.Response response;
      final String _url =
          'https://api.themoviedb.org/3/movie/popular?api_key=$key&language=pt-BR&page=1';

      response = await http.get(Uri.parse(_url));

      Map<String, dynamic> activity = json.decode(response.body);

      return Right(Movie.fromMap(activity));
    } catch (e) {
      rethrow;
    }
  }
}
