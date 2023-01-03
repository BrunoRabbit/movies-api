import 'package:bloc/bloc.dart';
import 'package:movies_api/core/utils/use_case.dart';
import 'package:movies_api/features/home_page/domain/entities/top_rated.dart';

import 'package:movies_api/features/home_page/domain/usecases/get_top_rated.dart';

part 'top_rated_event.dart';
part 'top_rated_state.dart';

class TopRatedBloc extends Bloc<TopRatedEvent, TopRatedState> {
  final GetTopRated getTopRated;

  TopRatedBloc({required this.getTopRated}) : super(TopRatedLoading()) {
    on<TopRatedLoad>((_onTopRatedLoad));
  }

  _onTopRatedLoad(TopRatedLoad event, Emitter<TopRatedState> emit) async {
    emit(TopRatedLoading());
    final errorOrTopRated = await getTopRated(NoParams());

    errorOrTopRated.fold((failure) {
      emit(TopRatedError(error: failure.toString()));
    }, (topRated) {
      emit(TopRatedLoaded(topRated: topRated));
    });
  }
}
