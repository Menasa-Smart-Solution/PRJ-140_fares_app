part of 'store_parcels_cubit.dart';

class StoreParcelsState extends Equatable {
  final StateType getAllStoreParcelsState;
  final List<StoreParcelModel> storeParcels;
  final String? errorMessage;

  final StateType getStoreParcelDetailsState;
  final StoreParcelModel? storeParcelDetails;
  const StoreParcelsState({
    this.getAllStoreParcelsState = StateType.initial,
    this.storeParcels = const [],
    this.errorMessage,
    this.getStoreParcelDetailsState = StateType.initial,
    this.storeParcelDetails,
  });
  @override
  List<Object?> get props => [
    getAllStoreParcelsState,
    storeParcels,
    errorMessage,
    getStoreParcelDetailsState,
    storeParcelDetails,
  ];

  StoreParcelsState copyWith({
    StateType? getAllStoreParcelsState,
    List<StoreParcelModel>? storeParcels,
    String? errorMessage,
    StateType? getStoreParcelDetailsState,
    StoreParcelModel? storeParcelDetails,
  }) {
    return StoreParcelsState(
      getAllStoreParcelsState:
          getAllStoreParcelsState ?? this.getAllStoreParcelsState,
      storeParcels: storeParcels ?? this.storeParcels,
      errorMessage: errorMessage ?? this.errorMessage,
      getStoreParcelDetailsState:
          getStoreParcelDetailsState ?? this.getStoreParcelDetailsState,
      storeParcelDetails: storeParcelDetails ?? this.storeParcelDetails,
    );
  }
}
