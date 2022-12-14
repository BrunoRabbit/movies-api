part of 'trending_api_bloc.dart';

abstract class TrendingApiState extends Equatable {
  const TrendingApiState();

  @override
  List<Object> get props => [];
}

class TrendingApiInitial extends TrendingApiState {}

class TrendingApiLoading extends TrendingApiState {}

class TrendingApiLoaded extends TrendingApiState {
  final Trending trending;

  const TrendingApiLoaded({
    required this.trending,
  });
}

class TrendingApiError extends TrendingApiState {
  final String error;

  const TrendingApiError(
    this.error,
  );
}
