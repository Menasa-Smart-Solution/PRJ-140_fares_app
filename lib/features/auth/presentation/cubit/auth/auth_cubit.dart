import 'package:fares/core/utils/exports.dart';
import 'package:fares/features/auth/data/models/auth_request_model.dart';
import 'package:fares/features/auth/data/models/branches_response_model.dart'
    show BranchModel;
import 'package:fares/features/auth/data/models/register_request_model.dart';
import 'package:fares/features/auth/data/repositories/auth_repo.dart';
import 'package:fares/features/auth/presentation/cubit/auth/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(const AuthState());
  final AuthRepo _authRepo;

  Future<void> login(String email, String password) async {
    emit(state.copyWith(type: StateType.loading));
    final result = await _authRepo.login(
      LoginRequestModel(email: email, password: password),
    );
    result.fold(
      (failure) {
        emit(
          state.copyWith(type: StateType.error, errorMessage: failure.message),
        );
      },
      (response) {
        emit(
          state.copyWith(
            type: StateType.success,
            userModel: response.data,
            successMessage: LocaleKeys.loginSuccess.tr(),
          ),
        );
      },
    );
  }

  Future<void> selectBranch(BranchModel? branch) async {
    emit(state.copyWith(selectedBranch: branch));
  }

  Future<void> register(RegisterRequestModel body) async {
    emit(state.copyWith(type: StateType.loading));
    final result = await _authRepo.register(
      RegisterRequestModel(
        address: body.address,
        branchId: state.selectedBranch?.id,
        email: body.email,
        name: body.name,
        password: body.password,
        phone: body.phone,
        phone2: body.phone2,
        ownerName: body.ownerName,
        passwordConfirmation: body.passwordConfirmation,
      ),
    );
    result.fold(
      (failure) {
        emit(
          state.copyWith(type: StateType.error, errorMessage: failure.message),
        );
      },
      (response) {
        emit(
          state.copyWith(
            type: StateType.success,
            registeredUser: response.data,
            successMessage: LocaleKeys.registerSuccess.tr(),
            isRegistered: true,
          ),
        );
      },
    );
  }

  Future<void> getAllBranches() async {
    emit(state.copyWith(getBranchesState: StateType.loading));
    final result = await _authRepo.getAllBranches();
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            getBranchesState: StateType.error,
            errorMessage: failure.message,
          ),
        );
      },
      (response) {
        emit(
          state.copyWith(
            getBranchesState: StateType.success,
            branches: response.branches,
          ),
        );
      },
    );
  }

  void clearState() {
    emit(const AuthState());
  }
}
