part of 'orders_cubit.dart';

class OrdersState extends Equatable {
  final StateType ordersState;
  final ParcelsResponseModel? orders;
  final String? errorMessage;
  final List<ParcelModel> allParcels; // Accumulated list for infinite scroll
  final int currentPage;
  final bool hasMorePages;
  final bool isLoadingMore;

  const OrdersState({
    this.ordersState = StateType.initial,
    this.orders,
    this.errorMessage,
    this.allParcels = const [],
    this.currentPage = 1,
    this.hasMorePages = true,
    this.isLoadingMore = false,
  });

  OrdersState copyWith({
    StateType? ordersState,
    ParcelsResponseModel? orders,
    String? errorMessage,
    List<ParcelModel>? allParcels,
    int? currentPage,
    bool? hasMorePages,
    bool? isLoadingMore,
  }) {
    return OrdersState(
      ordersState: ordersState ?? this.ordersState,
      orders: orders ?? this.orders,
      errorMessage: errorMessage ?? this.errorMessage,
      allParcels: allParcels ?? this.allParcels,
      currentPage: currentPage ?? this.currentPage,
      hasMorePages: hasMorePages ?? this.hasMorePages,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }

  @override
  List<Object?> get props => [
    ordersState,
    orders,
    errorMessage,
    allParcels,
    currentPage,
    hasMorePages,
    isLoadingMore,
  ];
}
