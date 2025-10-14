import 'package:equatable/equatable.dart';
import 'package:fares/core/enums/enums.dart';
import 'package:fares/features/auth/data/models/auth_response_model.dart';
import 'package:fares/features/auth/data/models/branches_response_model.dart';
import 'package:fares/features/auth/data/models/register_response_model.dart';

class AuthState extends Equatable {
  final StateType type;
  final AuthModel? userModel;
  final String? errorMessage;

  final RegisterModel? registeredUser;

  final StateType getBranchesState;
  final List<BranchModel> branches;

  final BranchModel? selectedBranch;
  final StateType selectBranchState;
  final String? successMessage;
  final bool isRegistered;

  const AuthState({
    this.type = StateType.initial,
    this.userModel,
    this.errorMessage,
    this.getBranchesState = StateType.loading,
    this.branches = const [],
    this.selectedBranch,
    this.successMessage,
    this.selectBranchState = StateType.initial,
    this.registeredUser,
    this.isRegistered = false,
  });

  @override
  List<Object?> get props => [
    type,
    userModel,
    errorMessage,
    getBranchesState,
    branches,
    selectedBranch,
    selectBranchState,
    successMessage,
    registeredUser,
    isRegistered,
  ];

  AuthState copyWith({
    StateType? type,
    AuthModel? userModel,
    String? errorMessage,
    StateType? getBranchesState,
    List<BranchModel>? branches,
    BranchModel? selectedBranch,
    StateType? selectBranchState,
    String? successMessage,
    RegisterModel? registeredUser,
    bool? isRegistered,
  }) {
    return AuthState(
      type: type ?? this.type,
      userModel: userModel ?? this.userModel,
      errorMessage: errorMessage ?? this.errorMessage,
      getBranchesState: getBranchesState ?? this.getBranchesState,
      branches: branches ?? this.branches,
      selectedBranch: selectedBranch ?? this.selectedBranch,
      selectBranchState: selectBranchState ?? this.selectBranchState,
      successMessage: successMessage ?? this.successMessage,
      registeredUser: registeredUser ?? this.registeredUser,
      isRegistered: isRegistered ?? this.isRegistered,
    );
  }
}
