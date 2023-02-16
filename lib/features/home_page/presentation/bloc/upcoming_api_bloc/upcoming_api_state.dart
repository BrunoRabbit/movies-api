part of 'upcoming_api_bloc.dart';

abstract class UpcomingApiState extends Equatable {
  const UpcomingApiState();
  
  @override
  List<Object> get props => [];
}

class UpcomingApiInitial extends UpcomingApiState {}

class UpcomingApiLoading extends UpcomingApiState {}

class UpcomingApiLoaded extends UpcomingApiState {
  final UpcomingMovie upcomingMovie;

  const UpcomingApiLoaded({
    required this.upcomingMovie,
  });
}

class UpcomingApiError extends UpcomingApiState {
  final String error;

  const UpcomingApiError(
    this.error,
  );
}