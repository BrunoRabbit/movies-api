part of 'top_rated_bloc.dart';

class TopRatedState {}

class TopRatedLoading extends TopRatedState {}

class TopRatedLoaded extends TopRatedState {
  final TopRated topRated;

  TopRatedLoaded({
    required this.topRated,
  });
}

class TopRatedError extends TopRatedState {
  String error;

  TopRatedError({
    required this.error,
  });
}
