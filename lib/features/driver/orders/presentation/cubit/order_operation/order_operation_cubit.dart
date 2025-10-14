import 'package:fares/core/services/internet_service.dart';
import 'package:fares/core/utils/exports.dart';
import 'package:fares/features/driver/orders/data/models/cancel_order_reasons_response.dart';
import 'package:fares/features/driver/orders/data/models/change_order_status_request.dart';
import 'package:fares/features/driver/orders/data/models/partial_delivery_request.dart';
import 'package:fares/features/driver/orders/data/repositories/orders_repo.dart';
import 'package:fares/features/driver/orders/presentation/cubit/order_operation/order_operation_state.dart';

class OrderOperationCubit extends Cubit<OrderOperationState> {
  OrderOperationCubit(this._internetService, this._ordersRepo)
    : super(const OrderOperationState());
  final InternetService _internetService;
  final OrdersRepo _ordersRepo;

  ReasonsModel? get selectedReason => state.selectedReason;

  Future<void> updateOrderStatus(ChangeOrderStatusRequest body) async {
    emit(state.copyWith(changeOrderStatusState: StateType.loading));
    if (await _internetService.isConnected()) {
      final result = await _ordersRepo.updateOrderStatus(body: body);
      result.fold(
        (failure) {
          emit(
            state.copyWith(
              changeOrderStatusState: StateType.error,
              errorMessage: failure.message,
            ),
          );
        },
        (success) {
          emit(state.copyWith(changeOrderStatusState: StateType.success));
        },
      );
    } else {
      emit(
        state.copyWith(
          changeOrderStatusState: StateType.noInternet,
          errorMessage: LocaleKeys.noNetworkConnection.tr(),
        ),
      );
    }
  }

  void selectReason(ReasonsModel? reason) {
    emit(state.copyWith(selectedReason: reason));
  }

  Future<void> partialOrderStatus(PartialDeliveryRequest body) async {
    if (await _internetService.isConnected()) {
      emit(state.copyWith(changeOrderStatusState: StateType.loading));
      final result = await _ordersRepo.partialOrderStatus(body: body);
      result.fold(
        (failure) {
          emit(
            state.copyWith(
              changeOrderStatusState: StateType.error,
              errorMessage: failure.message,
            ),
          );
        },
        (success) {
          emit(state.copyWith(changeOrderStatusState: StateType.success));
        },
      );
    } else {
      emit(
        state.copyWith(
          changeOrderStatusState: StateType.noInternet,
          errorMessage: LocaleKeys.noNetworkConnection.tr(),
        ),
      );
    }
  }

  void cancelOrderReasons() async {
    emit(state.copyWith(cancelOrderReasonsState: StateType.loading));
    if (await _internetService.isConnected()) {
      final result = await _ordersRepo.getCancelOrderReasons();
      result.fold(
        (failure) {
          emit(
            state.copyWith(
              cancelOrderReasonsState: StateType.error,
              errorMessage: failure.message,
            ),
          );
        },
        (response) {
          emit(
            state.copyWith(
              cancelOrderReasonsState: StateType.success,
              cancelOrderReasons: response.reasons,
            ),
          );
        },
      );
    } else {
      emit(
        state.copyWith(
          cancelOrderReasonsState: StateType.noInternet,
          errorMessage: LocaleKeys.noNetworkConnection.tr(),
        ),
      );
    }
  }
}
