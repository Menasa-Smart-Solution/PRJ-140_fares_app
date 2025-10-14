import 'package:equatable/equatable.dart';
import 'package:fares/core/enums/enums.dart';
import 'package:fares/features/auth/data/models/auth_request_model.dart';
import 'package:fares/features/auth/data/models/auth_response_model.dart';
import 'package:fares/features/auth/data/repositories/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

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
        emit(state.copyWith(type: StateType.success, userModel: response.data));
      },
    );
  }
}
