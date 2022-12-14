import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_api/core/utils/use_case.dart';
import 'package:movies_api/features/home_page/domain/entities/trending.dart';
import 'package:movies_api/features/home_page/domain/usecases/get_trending_api.dart';

part 'trending_api_event.dart';
part 'trending_api_state.dart';

class TrendingApiBloc extends Bloc<TrendingApiEvent, TrendingApiState> {
  final GetTrendingApi getTrendingApi;

  TrendingApiBloc({required this.getTrendingApi})
      : super(TrendingApiLoading()) {
    on<TrendingApiLoad>(_onLoad);
  }

  _onLoad(TrendingApiEvent event, Emitter<TrendingApiState> emit) async {
    emit(TrendingApiLoading());
    final errorOrTrending = await getTrendingApi(NoParams());

    errorOrTrending.fold((error) {
      emit(TrendingApiError(error.toString()));
    }, (trending) {
      emit(TrendingApiLoaded(trending: trending));
    });
  }
}
