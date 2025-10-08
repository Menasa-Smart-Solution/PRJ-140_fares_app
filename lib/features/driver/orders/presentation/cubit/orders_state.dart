part of 'orders_cubit.dart';

class OrdersState extends Equatable {
  final StateType ordersState;
  final ParcelsResponseModel? orders;
  final String? errorMessage;

  const OrdersState({
    this.ordersState = StateType.loading,
    this.orders,
    this.errorMessage,
  });

  OrdersState copyWith({
    StateType? ordersState,
    ParcelsResponseModel? orders,
    String? errorMessage,
  }) {
    return OrdersState(
      ordersState: ordersState ?? this.ordersState,
      orders: orders ?? this.orders,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [ordersState, orders, errorMessage];
}
