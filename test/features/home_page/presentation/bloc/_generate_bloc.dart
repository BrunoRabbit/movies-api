import 'package:mockito/annotations.dart';
import 'package:movies_api/features/home_page/presentation/bloc/configurate_api_bloc/configurate_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/popular_api_bloc/popular_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/trending_api_bloc/trending_api_bloc.dart';

@GenerateNiceMocks([
  MockSpec<ConfigurateApiBloc>(),
  MockSpec<PopularApiBloc>(),
  MockSpec<TrendingApiBloc>(),
])
void main() {}
