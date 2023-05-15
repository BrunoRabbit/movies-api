import 'package:bloc/bloc.dart';

class PageSearchCubit extends Cubit<int> {
  PageSearchCubit() : super(1);

  void incrementIndex() {
    emit(state + 1);
  }

  void decrementIndex() {
    emit(state - 1);
  }
}
