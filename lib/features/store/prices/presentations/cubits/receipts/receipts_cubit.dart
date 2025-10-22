import 'package:equatable/equatable.dart';
import 'package:fares/core/enums/enums.dart';
import 'package:fares/features/store/prices/data/models/receipt_response_model.dart';
import 'package:fares/features/store/prices/data/repos/prices_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/services/internet_service.dart';

part 'receipts_state.dart';

class ReceiptsCubit extends Cubit<ReceiptsState> {
  final PricesRepo _repo;
  final InternetService _internetService;

  ReceiptsCubit(this._repo, this._internetService)
    : super(const ReceiptsState());

  Future<void> getReceipts({bool isLoadMore = false}) async {
    // Don't load if already loading or no more data
    if (state.getAllReceiptsState == StateType.loading ||
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
          getAllReceiptsState: StateType.loading,
          currentPage: 1,
          hasMoreData: true,
        ),
      );
    }

    if (!await _internetService.isConnected()) {
      emit(
        state.copyWith(
          getAllReceiptsState: StateType.noInternet,
          isLoadingMore: false,
        ),
      );
      return;
    }

    final result = await _repo.getReceipts(page: currentPage);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            getAllReceiptsState: StateType.error,
            errorMessage: failure.message,
            isLoadingMore: false,
          ),
        );
      },
      (receiptResponse) {
        final newReceipts = receiptResponse.data.data;
        final allReceipts = isLoadMore
            ? [...state.receipts, ...newReceipts]
            : newReceipts;

        // Check if there's more data to load
        final hasMoreData =
            newReceipts.isNotEmpty &&
            newReceipts.length >= 10; // Assuming 10 items per page

        emit(
          state.copyWith(
            getAllReceiptsState: allReceipts.isEmpty
                ? StateType.empty
                : StateType.success,
            receipts: allReceipts,
            currentPage: currentPage,
            hasMoreData: hasMoreData,
            isLoadingMore: false,
          ),
        );
      },
    );
  }

  void resetPagination() {
    emit(state.copyWith(currentPage: 1, hasMoreData: true, receipts: []));
  }

  Future<void> getReceiptDetails(int id) async {
    emit(state.copyWith(receiptDetailsState: StateType.loading));

    if (!await _internetService.isConnected()) {
      emit(state.copyWith(receiptDetailsState: StateType.noInternet));
      return;
    }

    final result = await _repo.getReceiptDetails(id: id);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            receiptDetailsState: StateType.error,
            errorMessage: failure.message,
          ),
        );
      },
      (receiptDetailsResponse) {
        emit(
          state.copyWith(
            receiptDetailsState: StateType.success,
            receiptDetails: receiptDetailsResponse.data,
          ),
        );
      },
    );
  }
}
