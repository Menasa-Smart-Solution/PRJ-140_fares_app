part of 'call_records_cubit.dart';

class CallRecordsState extends Equatable {
  final StateType callRecordsState;
  final List<CallImageModel>? callImages;
  final String? errorMessage;
  const CallRecordsState({
    this.callRecordsState = StateType.loading,
    this.callImages,
    this.errorMessage,
  });

  CallRecordsState copyWith({
    StateType? callRecordsState,
    List<CallImageModel>? callImages,
    String? errorMessage,
  }) {
    return CallRecordsState(
      callRecordsState: callRecordsState ?? this.callRecordsState,
      callImages: callImages ?? this.callImages,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
    callRecordsState,
    callImages ?? '',
    errorMessage ?? '',
  ];
}
