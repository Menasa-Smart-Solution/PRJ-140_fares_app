import 'package:equatable/equatable.dart';
import 'package:fares/core/enums/enums.dart';
import 'package:fares/features/driver/home/data/models/summary_response_model.dart';
import 'package:fares/features/driver/home/data/repositories/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(const HomeState());

  Future<void> getAllSummary() async {
    emit(state.copyWith(getAllSummaryState: StateType.loading));
    final result = await homeRepo.getAllSummary();
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            getAllSummaryState: StateType.error,
            errorMessage: failure.message,
          ),
        );
      },
      (result) {
        emit(
          state.copyWith(
            getAllSummaryState: StateType.success,
            summary: result,
          ),
        );
      },
    );
  }
}
