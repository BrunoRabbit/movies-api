import 'package:dartz/dartz.dart';

import 'package:movies_api/core/error/failure.dart';
import 'package:movies_api/core/utils/use_case.dart';
import 'package:movies_api/features/home_page/domain/entities/top_rated.dart';
import 'package:movies_api/features/home_page/domain/repositories/api_repository.dart';

class GetTopRated extends UseCase<TopRated, NoParams> {
  final ApiRepository repository;

  GetTopRated(
    this.repository,
  );
  @override
  Future<Either<Failure, TopRated>> call(NoParams params) async {
    return await repository.getTopRated();
  }
}
