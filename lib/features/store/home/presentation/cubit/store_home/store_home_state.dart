part of 'store_home_cubit.dart';

class StoreHomeState extends Equatable {
  final StateType getStoreHomeState;
  final StoreHomeModel? storeHome;
  final String? errorMessage;
  final StateType logOutState;
  const StoreHomeState({
    this.getStoreHomeState = StateType.loading,
    this.storeHome,
    this.errorMessage,
    this.logOutState = StateType.initial,
  });
  StoreHomeState copyWith({
    StateType? getStoreHomeState,
    StoreHomeModel? storeHome,
    String? errorMessage,
    StateType? logOutState,
  }) {
    return StoreHomeState(
      getStoreHomeState: getStoreHomeState ?? this.getStoreHomeState,
      storeHome: storeHome ?? this.storeHome,
      errorMessage: errorMessage,
      logOutState: logOutState ?? this.logOutState,
    );
  }

  @override
  List<Object?> get props => [
    getStoreHomeState,
    storeHome,
    errorMessage,
    logOutState,
  ];
}
