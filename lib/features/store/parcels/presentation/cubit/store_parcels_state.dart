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
  final StateType deleteParcelState;

  const StoreParcelsState({
    this.getAllStoreParcelsState = StateType.initial,
    this.getStoreParcelDetailsState = StateType.initial,
    this.storeParcels = const [],
    this.storeParcelDetails,
    this.errorMessage,
    this.currentPage = 1,
    this.hasMoreData = true,
    this.isLoadingMore = false,
    this.deleteParcelState = StateType.initial,
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
    StateType? deleteParcelState,
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
      deleteParcelState: deleteParcelState ?? this.deleteParcelState,
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
    deleteParcelState,
  ];
}
