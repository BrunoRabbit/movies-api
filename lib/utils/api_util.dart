import 'package:equatable/equatable.dart';
import 'package:movies_api/utils/errors_util.dart';

abstract class Api<T, P> {
  // true or Params
  Future<Api<ErrorsUtils, T>> call(T params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
