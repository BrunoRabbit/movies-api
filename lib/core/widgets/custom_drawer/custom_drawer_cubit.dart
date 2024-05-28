import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_api/core/widgets/custom_drawer/custom_drawer_cubit_state.dart';

class CustomDrawerCubit extends Cubit<CustomDrawerCubitState> {
  CustomDrawerCubit() : super(CustomDrawerCubitState(100, false));

  void onEnterDrawer() {
    emit(CustomDrawerCubitState(state.width + 100, false));
  }

  void onExitDrawer() {
    emit(CustomDrawerCubitState(state.width, true));
    Future.delayed(const Duration(milliseconds: 125), () {
      emit(CustomDrawerCubitState(state.width - 100, false));
    });
  }
}
