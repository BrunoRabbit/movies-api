part of 'popular_api_bloc.dart';

class PopularApiState {}

class PopularApiLoading extends PopularApiState {}

class PopularApiLoaded extends PopularApiState {
  Movie movie;

  PopularApiLoaded({
    required this.movie,
  });
}

class PopularApiError extends PopularApiState {
  String error;

  PopularApiError(
    this.error,
  );
}
