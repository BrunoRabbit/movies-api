// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_api_bloc.dart';

abstract class SearchApiEvent extends Equatable {
  const SearchApiEvent();

  @override
  List<Object> get props => [];
}

class SearchQueryLoad extends SearchApiEvent {
  final String name;
  final int page;

  const SearchQueryLoad({
    required this.name,
    this.page = 1,
  });
}

