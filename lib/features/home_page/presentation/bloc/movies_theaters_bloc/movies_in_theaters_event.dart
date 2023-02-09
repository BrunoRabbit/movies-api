part of 'movies_in_theaters_bloc.dart';

abstract class MoviesInTheatersEvent extends Equatable {
  const MoviesInTheatersEvent();

  @override
  List<Object> get props => [];
}

class MoviesInTheatersLoad extends MoviesInTheatersEvent {}
