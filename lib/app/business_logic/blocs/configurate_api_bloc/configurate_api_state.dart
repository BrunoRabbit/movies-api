part of 'configurate_api_bloc.dart';

class ConfigurateApiState {}

class ConfigurateApiLoading extends ConfigurateApiState {}

class ConfigurateApiLoaded extends ConfigurateApiState {
  Config config;

  ConfigurateApiLoaded({
    required this.config,
  });
}

class ConfigurateApiError extends ConfigurateApiState {
  String error;

  ConfigurateApiError(
    this.error,
  );
}
