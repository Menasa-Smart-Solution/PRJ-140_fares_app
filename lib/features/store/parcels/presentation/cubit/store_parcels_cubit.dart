import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fares/core/services/internet_service.dart';
import 'package:fares/core/utils/exports.dart';
import 'package:fares/features/store/parcels/data/models/store_parcels_response_model.dart';
import 'package:fares/features/store/parcels/data/repos/store_parcels_repo.dart';

part 'store_parcels_state.dart';

class StoreParcelsCubit extends Cubit<StoreParcelsState> {
  final StoreParcelsRepo _repo;
  final InternetService _internetService;
  StoreParcelsCubit(this._repo, this._internetService)
    : super(const StoreParcelsState());

  Future<void> getStoreParcels({String? status, String? id}) async {
    emit(state.copyWith(getAllStoreParcelsState: StateType.loading));
    if (!await _internetService.isConnected()) {
      emit(state.copyWith(getAllStoreParcelsState: StateType.noInternet));
      return;
    }

    final result = await _repo.getStoreParcels(status: status, id: id, page: 1);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            getAllStoreParcelsState: StateType.error,
            errorMessage: failure.message,
          ),
        );
      },
      (parcels) {
        emit(
          state.copyWith(
            getAllStoreParcelsState: StateType.success,
            storeParcels: parcels,
          ),
        );
      },
    );
  }

  Future<void> getStoreParcelDetails(int id) async {
    emit(state.copyWith(getStoreParcelDetailsState: StateType.loading));
    if (!await _internetService.isConnected()) {
      emit(state.copyWith(getStoreParcelDetailsState: StateType.noInternet));
      return;
    }

    final result = await _repo.getStoreParcelDetails(id);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            getStoreParcelDetailsState: StateType.error,
            errorMessage: failure.message,
          ),
        );
      },
      (parcel) {
        emit(
          state.copyWith(
            getStoreParcelDetailsState: StateType.success,
            storeParcelDetails: parcel,
          ),
        );
      },
    );
  }

  @override
  void emit(StoreParcelsState state) {
    if (isClosed) return;
    super.emit(state);
  }
}
