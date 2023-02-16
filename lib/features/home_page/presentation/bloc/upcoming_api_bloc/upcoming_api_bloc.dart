// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_api/core/utils/use_case.dart';

import 'package:movies_api/features/home_page/domain/entities/upcoming_movie.dart';
import 'package:movies_api/features/home_page/domain/usecases/get_upcoming_api.dart';

part 'upcoming_api_event.dart';
part 'upcoming_api_state.dart';

class UpcomingApiBloc extends Bloc<UpcomingApiEvent, UpcomingApiState> {
  GetUpcomingApi getUpcomingApi;
  
  UpcomingApiBloc({required this.getUpcomingApi}) : super(UpcomingApiLoading()) {
    on<UpcomingApiLoad>(_onUpcomingLoad);
  }
  _onUpcomingLoad(UpcomingApiLoad event, Emitter<UpcomingApiState> emit) async {
    emit(UpcomingApiLoading());

    final errorOrUpcomingMovie = await getUpcomingApi(NoParams());

    errorOrUpcomingMovie.fold((error) {
      emit(UpcomingApiError(error.toString()));
    }, (upcomingMovie) {
      emit(UpcomingApiLoaded(upcomingMovie: upcomingMovie));
    });
  }
}
