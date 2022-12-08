part of 'trending_api_bloc.dart';

abstract class TrendingApiEvent extends Equatable {
  const TrendingApiEvent();

  @override
  List<Object> get props => [];
}

class TrendingApiLoad extends TrendingApiEvent {}
