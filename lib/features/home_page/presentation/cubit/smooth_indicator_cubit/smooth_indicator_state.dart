part of 'smooth_indicator_cubit.dart';

// ignore: must_be_immutable
class SmoothIndicatorState extends Equatable {
  int value;

  SmoothIndicatorState({
    required this.value,
  });

  @override
  List<Object?> get props => [value];
}
