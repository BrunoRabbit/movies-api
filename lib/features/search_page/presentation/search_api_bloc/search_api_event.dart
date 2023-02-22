part of 'search_api_bloc.dart';

abstract class SearchApiEvent extends Equatable {
  const SearchApiEvent();

  @override
  List<Object> get props => [];
}

class SearchQueryLoad extends SearchApiEvent {
  final String name;
  
  const SearchQueryLoad({
    required this.name,
  });
}
