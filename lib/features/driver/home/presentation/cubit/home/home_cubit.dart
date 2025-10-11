import 'package:equatable/equatable.dart';
import 'package:fares/core/enums/enums.dart';
import 'package:fares/core/services/internet_service.dart';
import 'package:fares/features/driver/home/data/models/summary_response_model.dart';
import 'package:fares/features/driver/home/data/repositories/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit(this.homeRepo, this._internetService) : super(const HomeState());
  final InternetService _internetService;

  Future<void> getAllSummary() async {
    emit(state.copyWith(getAllSummaryState: StateType.loading));
    if (!await _internetService.isConnected()) {
      emit(state.copyWith(getAllSummaryState: StateType.noInternet));
      return;
    }
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

  Future<void> logOut() async {
    emit(state.copyWith(logOutState: StateType.loading));
    if (!await _internetService.isConnected()) {
      emit(state.copyWith(logOutState: StateType.noInternet));
      return;
    }
    final result = await homeRepo.logOut();
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            logOutState: StateType.error,
            errorMessage: failure.message,
          ),
        );
      },
      (result) {
        emit(state.copyWith(logOutState: StateType.success));
      },
    );
  }

  Future<void> receiveParcels(String parcelId) async {
    emit(state.copyWith(receiveParcelsState: StateType.loading));
    if (!await _internetService.isConnected()) {
      emit(state.copyWith(receiveParcelsState: StateType.noInternet));
      return;
    }
    final result = await homeRepo.receiveParcels(parcelId);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            receiveParcelsState: StateType.error,
            errorMessage: failure.message,
          ),
        );
      },
      (result) {
        emit(state.copyWith(receiveParcelsState: StateType.success));
      },
    );
  }
}
