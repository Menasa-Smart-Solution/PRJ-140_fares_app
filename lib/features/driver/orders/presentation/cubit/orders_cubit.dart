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

  Future<void> getOrders({
    String? status,
    String? id,
    int? page,
    bool isRefresh = false,
  }) async {
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
        emit(
          state.copyWith(
            ordersState: StateType.success,
            orders: parcelsResponse,
          ),
        );
      },
    );
  }
}
