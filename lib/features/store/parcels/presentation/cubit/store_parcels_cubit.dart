import 'dart:developer';

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

  // Private cache to keep the previously loaded "full" list (used when clearing search)
  final List<StoreParcelModel> _cachedParcels = [];

  Future<void> getStoreParcels({
    String? status,
    String? id,
    bool isLoadMore = false,
    bool refresh = false,
    bool fromSearch = false,
  }) async {
    // If this call is coming from a search flow but there is no id,
    // do not restore cached data — return an empty result instead.
    final isSearch = id != null;
    if (fromSearch && !isSearch) {
      emit(
        state.copyWith(
          getAllStoreParcelsState: StateType.initial,
          storeParcels: [],
        ),
      );
      return;
    }

    // If not a search and not a refresh and we have cached data, restore it.
    // Note: do NOT restore cache when fromSearch == true (handled above).
    if (!isSearch &&
        !refresh &&
        !fromSearch &&
        _cachedParcels.isNotEmpty &&
        !isLoadMore) {
      emit(
        state.copyWith(
          getAllStoreParcelsState: _cachedParcels.isEmpty
              ? StateType.empty
              : StateType.success,
          storeParcels: [..._cachedParcels],
        ),
      );
      return;
    }

    // NEW: don't perform a search while a full load is already in progress
    if (isSearch && state.getAllStoreParcelsState == StateType.loading) {
      log('Search skipped: cubit is currently loading');
      return;
    }

    // If not a refresh, keep existing guards to prevent duplicate loads
    log(
      'Getting store parcels: status=$status id=$id refresh=$refresh loadMore=$isLoadMore',
    );
    if (!refresh) {
      if (state.getAllStoreParcelsState == StateType.loading ||
          (isLoadMore && state.isLoadingMore) ||
          (isLoadMore && !state.hasMoreData)) {
        return;
      }
    }

    final currentPage = isLoadMore ? state.currentPage + 1 : 1;

    // Set loading state based on whether it's initial load / refresh or load more
    if (isLoadMore) {
      emit(state.copyWith(isLoadingMore: true));
    } else {
      // For initial load or refresh we reset the list so UI shows fresh content
      emit(
        state.copyWith(
          getAllStoreParcelsState: StateType.loading,
          currentPage: 1,
          hasMoreData: true,
          storeParcels: [], // clear existing on initial load / refresh
          isLoadingMore: false,
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

        // If this is a normal listing (no id search), update cache.
        if (!isSearch) {
          if (isLoadMore) {
            _cachedParcels.addAll(newParcels);
          } else {
            _cachedParcels
              ..clear()
              ..addAll(allParcels);
          }
        }

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
