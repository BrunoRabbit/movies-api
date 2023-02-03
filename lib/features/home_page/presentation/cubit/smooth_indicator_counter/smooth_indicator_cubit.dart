import 'package:bloc/bloc.dart';

part 'smooth_indicator_state.dart';

class SmoothIndicatorCubit extends Cubit<SmoothIndicatorState> {
  SmoothIndicatorCubit() : super(SmoothIndicatorState(value: 0));

  void counter(int index) {
    emit(SmoothIndicatorState(value: state.value = index));
  }
}
