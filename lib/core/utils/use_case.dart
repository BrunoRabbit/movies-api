import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<T, P> {
  Future<Either<P, T>> call(P params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
