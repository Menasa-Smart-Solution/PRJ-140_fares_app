part of 'store_parcels_cubit.dart';

class StoreParcelsState extends Equatable {
  final StateType getAllStoreParcelsState;
  final StateType getStoreParcelDetailsState;
  final List<StoreParcelModel> storeParcels;
  final StoreParcelModel? storeParcelDetails;
  final String? errorMessage;
  final int currentPage;
  final bool hasMoreData;
  final bool isLoadingMore;

  const StoreParcelsState({
    this.getAllStoreParcelsState = StateType.initial,
    this.getStoreParcelDetailsState = StateType.initial,
    this.storeParcels = const [],
    this.storeParcelDetails,
    this.errorMessage,
    this.currentPage = 1,
    this.hasMoreData = true,
    this.isLoadingMore = false,
  });

  StoreParcelsState copyWith({
    StateType? getAllStoreParcelsState,
    StateType? getStoreParcelDetailsState,
    List<StoreParcelModel>? storeParcels,
    StoreParcelModel? storeParcelDetails,
    String? errorMessage,
    int? currentPage,
    bool? hasMoreData,
    bool? isLoadingMore,
  }) {
    return StoreParcelsState(
      getAllStoreParcelsState:
          getAllStoreParcelsState ?? this.getAllStoreParcelsState,
      getStoreParcelDetailsState:
          getStoreParcelDetailsState ?? this.getStoreParcelDetailsState,
      storeParcels: storeParcels ?? this.storeParcels,
      storeParcelDetails: storeParcelDetails ?? this.storeParcelDetails,
      errorMessage: errorMessage ?? this.errorMessage,
      currentPage: currentPage ?? this.currentPage,
      hasMoreData: hasMoreData ?? this.hasMoreData,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }

  @override
  List<Object?> get props => [
    getAllStoreParcelsState,
    getStoreParcelDetailsState,
    storeParcels,
    storeParcelDetails,
    errorMessage,
    currentPage,
    hasMoreData,
    isLoadingMore,
  ];
}
