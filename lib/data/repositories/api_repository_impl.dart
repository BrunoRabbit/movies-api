import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:movies_api/data/models/config.dart';
import 'package:movies_api/data/models/movie.dart';

import 'package:movies_api/data/repositories/api_repository.dart';
import 'package:movies_api/utils/errors_util.dart';

class ApiRepositoryImpl implements ApiRepository {
  final String key = dotenv.get("apiKey");

  @override
  Future<Config> getApiRequest() async {
    //? https://developers.themoviedb.org/3/configuration/get-api-configuration

    try {
      http.Response response;
      final String _url =
          'https://api.themoviedb.org/3/configuration?api_key=$key';

      response = await http.get(Uri.parse(_url));
      Map<String, dynamic> activity = json.decode(response.body);

      return Config.fromMap(activity);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Movie> getPopularMovies() async {
    try {
      http.Response response;
      final String _url =
          'https://api.themoviedb.org/3/movie/popular?api_key=$key&language=pt-BR&page=1';

      response = await http.get(Uri.parse(_url));

      Map<String, dynamic> activity = json.decode(response.body);

      return Movie.fromMap(activity);
    } catch (e) {
      rethrow;
    }
  }
}

class TypesError extends ErrorsUtils {
  String getError() {
    switch (runtimeType) {
      case ConnectionError:
        return 'Sem internet';
      case ApiConnectionError:
        return 'Algo de errado na API';
    }
    return 'Algo de errado';
  }
}
