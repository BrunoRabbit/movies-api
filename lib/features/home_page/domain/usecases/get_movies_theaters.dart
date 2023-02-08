// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:movies_api/core/utils/exports.dart';
import 'package:movies_api/features/home_page/domain/entities/movie_theater.dart';
import 'package:movies_api/features/home_page/domain/repositories/api_repository.dart';

class GetMoviesTheaters implements UseCase<MovieTheater, NoParams> {
  final ApiRepository apiRepository;

  GetMoviesTheaters(this.apiRepository);

  @override
  Future<Either<Failure, MovieTheater>> call(NoParams params) {
    return apiRepository.getMoviesTheaters();
  }
}
