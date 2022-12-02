import 'package:equatable/equatable.dart';

abstract class ErrorsUtils extends Equatable {
  @override
  List<Object?> get props => [];
}

class ConnectionError extends ErrorsUtils {}

class ApiConnectionError extends ErrorsUtils {
  final String error;

  ApiConnectionError({
    required this.error,
  });
}
