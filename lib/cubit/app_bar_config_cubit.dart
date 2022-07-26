import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_bar_config_state.dart';

class AppBarConfigCubit extends Cubit<AppBarConfigState> {
  AppBarConfigCubit() : super(const AppBarConfigState());

  void togglePinned() {
    emit(state.copyWith(isPinned: !state.isPinned));
  }

  void toggleFloating() {
    bool isSnap = state.isFloating ? false : state.isSnap;
    emit(state.copyWith(isFloating: !state.isFloating, isSnap: isSnap));
  }

  void toggleSnap() {
    bool isFloating = !state.isSnap ? true : state.isFloating;
    emit(state.copyWith(isFloating: isFloating, isSnap: !state.isSnap));
  }
}
