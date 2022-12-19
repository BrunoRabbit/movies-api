import 'package:mockito/annotations.dart';
import 'package:movies_api/features/home_page/domain/repositories/api_repository.dart';
import 'get_configuration_api_test.dart' as get_configuration_api_test;
import 'get_popular_movies_test.dart' as get_popular_movies_test;
import 'get_trending_api_test.dart' as get_trending_api_test;

@GenerateMocks([ApiRepository])
void main() {
  get_configuration_api_test.main();
  get_popular_movies_test.main();
  get_trending_api_test.main();
}
