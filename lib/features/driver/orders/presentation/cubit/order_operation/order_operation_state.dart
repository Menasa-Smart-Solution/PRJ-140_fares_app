import 'package:equatable/equatable.dart';
import 'package:fares/core/enums/enums.dart';
import 'package:fares/features/driver/orders/data/models/cancel_order_reasons_response.dart';

class OrderOperationState extends Equatable {
  final StateType changeOrderStatusState;
  final String? errorMessage;

  final StateType cancelOrderReasonsState;
  final List<ReasonsModel> cancelOrderReasons;
  final ReasonsModel? selectedReason;

  const OrderOperationState({
    this.changeOrderStatusState = StateType.initial,
    this.errorMessage,
    this.cancelOrderReasonsState = StateType.loading,
    this.cancelOrderReasons = const [],
    this.selectedReason,
  });

  OrderOperationState copyWith({
    StateType? changeOrderStatusState,
    String? errorMessage,
    StateType? cancelOrderReasonsState,
    List<ReasonsModel>? cancelOrderReasons,
    ReasonsModel? selectedReason,
  }) {
    return OrderOperationState(
      changeOrderStatusState:
          changeOrderStatusState ?? this.changeOrderStatusState,
      errorMessage: errorMessage,
      cancelOrderReasonsState:
          cancelOrderReasonsState ?? this.cancelOrderReasonsState,
      cancelOrderReasons: cancelOrderReasons ?? this.cancelOrderReasons,
      selectedReason: selectedReason ?? this.selectedReason,
    );
  }

  @override
  List<Object?> get props => [
    changeOrderStatusState,
    errorMessage,
    cancelOrderReasonsState,
    cancelOrderReasons,
    selectedReason,
  ];
}
