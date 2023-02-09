// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:movies_api/core/utils/exports.dart';
import 'package:movies_api/features/home_page/domain/entities/movie_in_theater.dart';
import 'package:movies_api/features/home_page/domain/repositories/api_repository.dart';

class GetMoviesInTheaters implements UseCase<MovieInTheater, NoParams> {
  final ApiRepository apiRepository;

  GetMoviesInTheaters(this.apiRepository);

  @override
  Future<Either<Failure, MovieInTheater>> call(NoParams params) {
    return apiRepository.getMoviesInTheaters();
  }
}
