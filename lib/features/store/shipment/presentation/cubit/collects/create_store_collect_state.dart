part of 'create_store_collect_cubit.dart';

class CreateStoreCollectState extends Equatable {
  final StateType createStoreCollectState;
  final String? errorMessage;
  final Set<String> selectedServices;

  final bool showWarning;

  const CreateStoreCollectState({
    this.createStoreCollectState = StateType.initial,
    this.errorMessage,
    this.selectedServices = const {},
    this.showWarning = false,
  });

  @override
  List<Object?> get props => [
    createStoreCollectState,
    errorMessage ?? '',
    selectedServices,
    showWarning,
  ];

  CreateStoreCollectState copyWith({
    StateType? createStoreCollectState,
    String? errorMessage,
    Set<String>? selectedServices,
    bool? showWarning,
  }) {
    return CreateStoreCollectState(
      createStoreCollectState:
          createStoreCollectState ?? this.createStoreCollectState,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedServices: selectedServices ?? this.selectedServices,
      showWarning: showWarning ?? this.showWarning,
    );
  }
}
