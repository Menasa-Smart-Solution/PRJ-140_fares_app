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

  Future<void> getStoreParcels({
    String? status,
    String? id,
    bool isLoadMore = false,
  }) async {
    // Don't load if already loading or no more data
    if (state.getAllStoreParcelsState == StateType.loading ||
        (isLoadMore && state.isLoadingMore) ||
        (isLoadMore && !state.hasMoreData)) {
      return;
    }

    final currentPage = isLoadMore ? state.currentPage + 1 : 1;

    // Set loading state based on whether it's initial load or load more
    if (isLoadMore) {
      emit(state.copyWith(isLoadingMore: true));
    } else {
      emit(
        state.copyWith(
          getAllStoreParcelsState: StateType.loading,
          currentPage: 1,
          hasMoreData: true,
        ),
      );
    }

    if (!await _internetService.isConnected()) {
      emit(
        state.copyWith(
          getAllStoreParcelsState: StateType.noInternet,
          isLoadingMore: false,
        ),
      );
      return;
    }

    final result = await _repo.getStoreParcels(
      status: status,
      id: id,
      page: currentPage,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            getAllStoreParcelsState: StateType.error,
            errorMessage: failure.message,
            isLoadingMore: false,
          ),
        );
      },
      (response) {
        final newParcels = response.data.parcels;
        final allParcels = isLoadMore
            ? [...state.storeParcels, ...newParcels]
            : newParcels;

        // Check if there's more data based on pagination info
        final hasMoreData = response.data.currentPage < response.data.lastPage;

        emit(
          state.copyWith(
            getAllStoreParcelsState: allParcels.isEmpty
                ? StateType.empty
                : StateType.success,
            storeParcels: allParcels,
            currentPage: currentPage,
            hasMoreData: hasMoreData,
            isLoadingMore: false,
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
