// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'movies_theaters_bloc.dart';

abstract class MoviesTheatersState extends Equatable {
  const MoviesTheatersState();

  @override
  List<Object> get props => [];
}

class MoviesTheatersLoading extends MoviesTheatersState {}

class MoviesTheatersLoaded extends MoviesTheatersState {
  final MovieTheater movieTheater;

  const MoviesTheatersLoaded({
    required this.movieTheater,
  });
}

class MoviesTheatersError extends MoviesTheatersState {
  final String error;

  const MoviesTheatersError(
    this.error,
  );
}
