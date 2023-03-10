// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:movies_api/features/search_page/domain/entities/search_result.dart';
import 'package:movies_api/features/search_page/domain/usecases/get_search_query.dart';

part 'search_api_event.dart';
part 'search_api_state.dart';

class SearchApiBloc extends Bloc<SearchApiEvent, SearchApiState> {
  final GetSearchQuery getSearchQuery;

  SearchApiBloc({required this.getSearchQuery}) : super(SearchApiInitial()) {
    on<SearchQueryLoad>(_onSearchQueryLoad);
  }

  void _onSearchQueryLoad(
      SearchQueryLoad event, Emitter<SearchApiState> emit) async {
    emit(SearchApiLoading());
    final errorOrSearchResult =
        await getSearchQuery(event.name, page: event.page);

    errorOrSearchResult.fold((error) {
      emit(SearchApiError(error.toString()));
    }, (searchResult) {
      emit(SearchApiLoaded(searchResult: searchResult));
    });
  }
}
