import 'package:bloc/bloc.dart';

class SearchCubit extends Cubit<int> {
  SearchCubit() : super(1);

  void incrementIndex() {
    emit(state + 1);
  }

  void decrementIndex() {
    emit(state - 1);
  }
}
