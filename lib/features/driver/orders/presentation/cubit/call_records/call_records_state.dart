part of 'call_records_cubit.dart';

class CallRecordsState extends Equatable {
  final StateType callRecordsState;
  final List<CallImageModel>? callImages;
  final String? errorMessage;

  final File? image;
  final StateType uploadImageState;

  final StateType pickImageState;

  const CallRecordsState({
    this.callRecordsState = StateType.loading,
    this.callImages,
    this.image,
    this.uploadImageState = StateType.initial,
    this.errorMessage,
    this.pickImageState = StateType.initial,
  });

  @override
  List<Object?> get props => [
    callRecordsState,
    callImages,
    errorMessage,
    image,
    uploadImageState,
    pickImageState,
  ];

  @override
  bool get stringify => true;

  CallRecordsState copyWith({
    StateType? callRecordsState,
    List<CallImageModel>? callImages,
    String? errorMessage,
    File? image,
    StateType? uploadImageState,
    StateType? pickImageState,
  }) {
    return CallRecordsState(
      callRecordsState: callRecordsState ?? this.callRecordsState,
      callImages: callImages ?? this.callImages,
      errorMessage: errorMessage ?? this.errorMessage,
      image: image ?? this.image,
      uploadImageState: uploadImageState ?? this.uploadImageState,
      pickImageState: pickImageState ?? this.pickImageState,
    );
  }
}
