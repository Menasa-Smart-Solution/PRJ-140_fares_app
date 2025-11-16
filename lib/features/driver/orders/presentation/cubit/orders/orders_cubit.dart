import 'package:equatable/equatable.dart';
import 'package:fares/core/enums/enums.dart';
import 'package:fares/core/services/internet_service.dart';
import 'package:fares/features/driver/orders/data/models/parcels_response_model.dart';
import 'package:fares/features/driver/orders/data/repositories/orders_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this._repo, this._internetService) : super(const OrdersState());
  final OrdersRepo _repo;
  final InternetService _internetService;

  // Fetch first page (initial load or refresh)
  Future<void> getOrders({
    String? status,
    String? id,
    bool isRefresh = false,
    bool isSearch = false,
  }) async {
    if (isRefresh) {
      // Reset pagination state on refresh
      emit(
        state.copyWith(
          ordersState: StateType.loading,
          allParcels: [],
          currentPage: 1,
          hasMorePages: true,
        ),
      );
    } else {
      emit(state.copyWith(ordersState: StateType.loading));
    }

    if (!await _internetService.isConnected()) {
      emit(state.copyWith(ordersState: StateType.noInternet));
      return;
    }

    if (isSearch == true && id == null) {
      emit(
        state.copyWith(
          ordersState: StateType.initial,
          orders: state.orders,
          allParcels: [],
          currentPage: 1,
          hasMorePages: false,
        ),
      );
      return;
    }

    final result = await _repo.getOrders(
      status: status,
      id: id,
      page: 1, // Always start from page 1
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            ordersState: StateType.error,
            errorMessage: failure.message,
          ),
        );
      },
      (parcelsResponse) {
        final parcelsData = parcelsResponse.data?.parcels;
        final newParcels = parcelsData?.data ?? [];
        final currentPage = parcelsData?.currentPage ?? 1;
        final lastPage = parcelsData?.lastPage ?? 1;
        final hasMore = currentPage < lastPage;

        emit(
          state.copyWith(
            ordersState: parcelsData!.data == null || parcelsData.data!.isEmpty
                ? StateType.empty
                : StateType.success,
            orders: parcelsResponse,
            allParcels: newParcels,
            currentPage: currentPage,
            hasMorePages: hasMore,
          ),
        );
      },
    );
  }

  // Load more (pagination)
  Future<void> loadMoreOrders({String? status, String? id}) async {
    // Don't load if already loading or no more pages
    if (state.isLoadingMore || !state.hasMorePages) return;

    emit(state.copyWith(isLoadingMore: true));

    if (!await _internetService.isConnected()) {
      emit(
        state.copyWith(isLoadingMore: false, ordersState: StateType.noInternet),
      );
      return;
    }

    final nextPage = state.currentPage + 1;
    final result = await _repo.getOrders(
      status: status,
      id: id,
      page: nextPage,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoadingMore: false,
            ordersState: StateType.error,
            errorMessage: failure.message,
          ),
        );
      },
      (parcelsResponse) {
        final parcelsData = parcelsResponse.data?.parcels;
        final newParcels = parcelsData?.data ?? [];
        final currentPage = parcelsData?.currentPage ?? nextPage;
        final lastPage = parcelsData?.lastPage ?? nextPage;
        final hasMore = currentPage < lastPage;

        // Append new parcels to existing list
        final updatedParcels = [...state.allParcels, ...newParcels];

        emit(
          state.copyWith(
            ordersState: StateType.success,
            orders: parcelsResponse,
            allParcels: updatedParcels,
            currentPage: currentPage,
            hasMorePages: hasMore,
            isLoadingMore: false,
          ),
        );
      },
    );
  }

  // Go to specific page (optional - for page buttons)
  Future<void> goToPage({required int page, String? status, String? id}) async {
    emit(state.copyWith(ordersState: StateType.loading));

    if (!await _internetService.isConnected()) {
      emit(state.copyWith(ordersState: StateType.noInternet));
      return;
    }

    final result = await _repo.getOrders(status: status, id: id, page: page);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            ordersState: StateType.error,
            errorMessage: failure.message,
          ),
        );
      },
      (parcelsResponse) {
        final parcelsData = parcelsResponse.data?.parcels;
        final newParcels = parcelsData?.data ?? [];
        final currentPage = parcelsData?.currentPage ?? page;
        final lastPage = parcelsData?.lastPage ?? page;
        final hasMore = currentPage < lastPage;

        emit(
          state.copyWith(
            ordersState: StateType.success,
            orders: parcelsResponse,
            allParcels: newParcels, // Replace with page data
            currentPage: currentPage,
            hasMorePages: hasMore,
          ),
        );
      },
    );
  }
}
