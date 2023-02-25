// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'page_navigator_cubit.dart';

abstract class PageNavigatorState extends Equatable {
  const PageNavigatorState();

  @override
  List<Object> get props => [];
}

class ChangePage extends PageNavigatorState {
  int page = 0;
  
  ChangePage({
   required this.page,
  });
}
