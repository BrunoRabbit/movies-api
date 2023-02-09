import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_api/core/utils/exports.dart';
import 'package:movies_api/features/home_page/domain/entities/movie_in_theater.dart';

import 'package:movies_api/features/home_page/domain/usecases/get_movies_in_theaters.dart';

part 'movies_in_theaters_event.dart';
part 'movies_in_theaters_state.dart';

class MoviesInTheatersBloc
    extends Bloc<MoviesInTheatersEvent, MoviesInTheatersState> {
  GetMoviesInTheaters getMoviesInTheaters;

  MoviesInTheatersBloc({required this.getMoviesInTheaters}) : super(MoviesInTheatersLoading()) {
    on<MoviesInTheatersLoad>(_onLoadMoviesTheaters);
  }

  _onLoadMoviesTheaters(
      MoviesInTheatersLoad event, Emitter<MoviesInTheatersState> emit) async {
    emit(MoviesInTheatersLoading());
    final errorsOrMoviesTheaters = await getMoviesInTheaters(NoParams());

    errorsOrMoviesTheaters.fold(
      (failure) => emit(MoviesInTheatersError(failure.toString())),
      (movieInTheater) => emit(
        MoviesInTheatersLoaded(movieInTheater: movieInTheater),
      ),
    );
  }
}
