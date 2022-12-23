import 'package:mockito/annotations.dart';
import 'package:movies_api/features/home_page/data/models/config_model.dart';
import 'package:movies_api/features/home_page/data/models/movie_model.dart';
import 'package:movies_api/features/home_page/data/models/trending_model.dart';

@GenerateNiceMocks([
  MockSpec<ConfigModel>(),
  MockSpec<MovieModel>(),
  MockSpec<TrendingModel>()
])
void main() {}
