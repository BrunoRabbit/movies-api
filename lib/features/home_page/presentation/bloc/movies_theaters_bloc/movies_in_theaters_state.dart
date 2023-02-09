// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'movies_in_theaters_bloc.dart';

abstract class MoviesInTheatersState extends Equatable {
  const MoviesInTheatersState();

  @override
  List<Object> get props => [];
}

class MoviesInTheatersLoading extends MoviesInTheatersState {}

class MoviesInTheatersLoaded extends MoviesInTheatersState {
  final MovieInTheater movieInTheater;

  const MoviesInTheatersLoaded({
    required this.movieInTheater,
  });
}

class MoviesInTheatersError extends MoviesInTheatersState {
  final String error;

  const MoviesInTheatersError(
    this.error,
  );
}
