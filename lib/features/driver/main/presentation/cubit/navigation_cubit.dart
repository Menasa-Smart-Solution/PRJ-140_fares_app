import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_state.dart';

class DriverMainCubit extends Cubit<DriverMainState> {
  DriverMainCubit() : super(const DriverMainState());

  void changeTab(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  void resetToHome() {
    emit(state.copyWith(currentIndex: 0));
  }
}
