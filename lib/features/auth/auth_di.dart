import 'package:fares/core/di/dependency_injection.dart';
import 'package:fares/features/auth/data/datasources/auth_data_source.dart';
import 'package:fares/features/auth/data/datasources/auth_data_source_impl.dart';
import 'package:fares/features/auth/data/repositories/auth_repo.dart';
import 'package:fares/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:fares/features/auth/presentation/cubit/reset_password/forget_password_cubit.dart';

Future<void> initAuthDI() async {
  getIt.registerLazySingleton<AuthDataSource>(
    () => AuthDataSourceImpl(apiService: getIt()),
  );

  getIt.registerLazySingleton(() => AuthRepo(dataSource: getIt()));

  getIt.registerFactory(() => AuthCubit(getIt()));
  getIt.registerFactory(() => ForgetPasswordCubit(getIt()));
}
