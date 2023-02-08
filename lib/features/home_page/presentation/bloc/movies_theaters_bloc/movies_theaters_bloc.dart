import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_api/core/utils/exports.dart';
import 'package:movies_api/features/home_page/domain/entities/movie_theater.dart';

import 'package:movies_api/features/home_page/domain/usecases/get_movies_theaters.dart';

part 'movies_theaters_event.dart';
part 'movies_theaters_state.dart';

class MoviesTheatersBloc
    extends Bloc<MoviesTheatersEvent, MoviesTheatersState> {
  GetMoviesTheaters getMoviesTheaters;

  MoviesTheatersBloc({required this.getMoviesTheaters}) : super(MoviesTheatersLoading()) {
    on<MoviesTheatersLoad>(_onLoadMoviesTheaters);
  }

  _onLoadMoviesTheaters(
      MoviesTheatersLoad event, Emitter<MoviesTheatersState> emit) async {
    emit(MoviesTheatersLoading());
    final errorsOrMoviesTheaters = await getMoviesTheaters(NoParams());

    errorsOrMoviesTheaters.fold(
      (failure) => emit(MoviesTheatersError(failure.toString())),
      (movieTheater) => emit(
        MoviesTheatersLoaded(movieTheater: movieTheater),
      ),
    );
  }
}
