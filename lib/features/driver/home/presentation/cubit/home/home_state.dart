part of 'home_cubit.dart';

class HomeState extends Equatable {
  final StateType getAllSummaryState;
  final SummaryResponseModel? summary;
  final String? errorMessage;

  final StateType logOutState;
  final StateType receiveParcelsState;

  const HomeState({
    this.getAllSummaryState = StateType.loading,
    this.summary,
    this.errorMessage = '',
    this.logOutState = StateType.initial,
    this.receiveParcelsState = StateType.initial,
  });

  @override
  List<Object?> get props => [
    getAllSummaryState,
    summary,
    errorMessage,
    logOutState,
    receiveParcelsState,
  ];

  HomeState copyWith({
    StateType? getAllSummaryState,
    SummaryResponseModel? summary,
    String? errorMessage,
    StateType? logOutState,
    StateType? receiveParcelsState,
  }) {
    return HomeState(
      getAllSummaryState: getAllSummaryState ?? this.getAllSummaryState,
      summary: summary ?? this.summary,
      errorMessage: errorMessage ?? this.errorMessage,
      logOutState: logOutState ?? this.logOutState,
      receiveParcelsState: receiveParcelsState ?? this.receiveParcelsState,
    );
  }
}
