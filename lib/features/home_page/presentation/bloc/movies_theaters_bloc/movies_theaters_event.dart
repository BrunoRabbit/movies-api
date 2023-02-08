part of 'movies_theaters_bloc.dart';

abstract class MoviesTheatersEvent extends Equatable {
  const MoviesTheatersEvent();

  @override
  List<Object> get props => [];
}

class MoviesTheatersLoad extends MoviesTheatersEvent {}
