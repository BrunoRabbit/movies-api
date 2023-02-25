import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'page_navigator_state.dart';

class PageNavigatorCubit extends Cubit<int> {
  PageNavigatorCubit() : super(0);

  void changePage(int index){
    emit(index);
  }
}
