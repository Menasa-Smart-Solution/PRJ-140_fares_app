import 'package:equatable/equatable.dart';
import 'package:fares/core/enums/enums.dart';

class OrderOperationState extends Equatable {
  final StateType changeOrderStatusState;
  final String? errorMessage;

  const OrderOperationState({
    this.changeOrderStatusState = StateType.initial,
    this.errorMessage,
  });

  OrderOperationState copyWith({
    StateType? changeOrderStatusState,
    String? errorMessage,
  }) {
    return OrderOperationState(
      changeOrderStatusState:
          changeOrderStatusState ?? this.changeOrderStatusState,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [changeOrderStatusState, errorMessage];
}
