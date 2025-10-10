import 'package:equatable/equatable.dart';
import 'package:fares/core/enums/enums.dart';
import 'package:fares/core/services/internet_service.dart';
import 'package:fares/features/driver/orders/data/models/call_images_response.dart';
import 'package:fares/features/driver/orders/data/repositories/orders_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'call_records_state.dart';

class CallRecordsCubit extends Cubit<CallRecordsState> {
  CallRecordsCubit(this._ordersRepo, this._internetService)
    : super(const CallRecordsState());
  final OrdersRepo _ordersRepo;
  final InternetService _internetService;

  Future<void> getCallImages({required int parcelId}) async {
    emit(const CallRecordsState(callRecordsState: StateType.loading));
    if (!await _internetService.isConnected()) {
      emit(const CallRecordsState(callRecordsState: StateType.noInternet));
      return;
    }
    final result = await _ordersRepo.getCallImages(parcelId: parcelId);
    result.fold(
      (failure) {
        emit(
          CallRecordsState(
            callRecordsState: StateType.error,
            errorMessage: failure.message,
          ),
        );
      },
      (result) {
        if (result.images.isEmpty) {
          emit(const CallRecordsState(callRecordsState: StateType.empty));
        } else {
          emit(
            CallRecordsState(
              callRecordsState: StateType.success,
              callImages: result.images,
            ),
          );
        }
      },
    );
  }
}
