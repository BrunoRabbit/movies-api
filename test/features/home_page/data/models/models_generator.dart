import 'package:mockito/annotations.dart';
import 'package:movies_api/features/home_page/data/models/config_model.dart';
import 'package:movies_api/features/home_page/data/models/movie_model.dart';
import 'package:movies_api/features/home_page/data/models/movie_in_theater_model.dart';
import 'package:movies_api/features/home_page/data/models/top_rated_model.dart';
import 'package:movies_api/features/home_page/data/models/trending_model.dart';
import 'package:movies_api/features/home_page/data/models/upcoming_movie_model.dart';

@GenerateNiceMocks([
  MockSpec<ConfigModel>(),
  MockSpec<MovieModel>(),
  MockSpec<TrendingModel>(),
  MockSpec<TopRatedModel>(),
  MockSpec<MovieInTheaterModel>(),
  MockSpec<UpcomingMovieModel>()
])
void main() {}
