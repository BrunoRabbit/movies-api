import 'package:bloc/bloc.dart';
import 'package:movies_api/core/utils/use_case.dart';
import 'package:movies_api/features/home_page/domain/entities/movie.dart';
import 'package:movies_api/features/home_page/domain/usecases/get_popular_movies.dart';

part 'popular_api_event.dart';
part 'popular_api_state.dart';

class PopularApiBloc extends Bloc<PopularApiEvent, PopularApiState> {
  final GetPopularMovies getPopularMovies;

  PopularApiBloc({required this.getPopularMovies})
      : super(PopularApiLoading()) {
    on<PopularApiLoad>(_onLoadApi);
  }

  _onLoadApi(PopularApiLoad event, Emitter<PopularApiState> emit) async {
    emit(PopularApiLoading());
    final errorOrMovie = await getPopularMovies(NoParams());

    errorOrMovie.fold((failure) {
      emit(PopularApiError(failure.toString()));
    }, (movies) {
      emit(PopularApiLoaded(movie: movies));
    });
  }
}
