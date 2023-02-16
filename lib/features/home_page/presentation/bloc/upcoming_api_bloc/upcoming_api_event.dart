part of 'upcoming_api_bloc.dart';

abstract class UpcomingApiEvent extends Equatable {
  const UpcomingApiEvent();

  @override
  List<Object> get props => [];
}

class UpcomingApiLoad extends UpcomingApiEvent {}
