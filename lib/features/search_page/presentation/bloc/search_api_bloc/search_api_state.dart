part of 'search_api_bloc.dart';

abstract class SearchApiState extends Equatable {
  const SearchApiState();
  
  @override
  List<Object> get props => [];
}

class SearchApiInitial extends SearchApiState {}

class SearchApiLoading extends SearchApiState {}

class SearchApiLoaded extends SearchApiState {
  final SearchResult searchResult;

  const SearchApiLoaded({
    required this.searchResult,
  });
}

class SearchApiError extends SearchApiState {
  final String error;

  const SearchApiError(
    this.error,
  );
}