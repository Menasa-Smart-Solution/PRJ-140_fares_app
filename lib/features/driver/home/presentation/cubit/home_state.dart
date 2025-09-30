part of 'home_cubit.dart';

class HomeState extends Equatable {
  final StateType getAllSummaryState;
  final SummaryResponseModel? summary;
  final String? errorMessage;

  const HomeState({
    this.getAllSummaryState = StateType.loading,
    this.summary,
    this.errorMessage = '',
  });
  @override
  List<Object> get props => [getAllSummaryState, ?summary, errorMessage ?? ''];

  HomeState copyWith({
    StateType? getAllSummaryState,
    SummaryResponseModel? summary,
    String? errorMessage,
  }) {
    return HomeState(
      getAllSummaryState: getAllSummaryState ?? this.getAllSummaryState,
      summary: summary ?? this.summary,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
