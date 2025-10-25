import 'package:fares/core/di/dependency_injection.dart';
import 'package:fares/features/profile/data/datasources/profile_data_source.dart';
import 'package:fares/features/profile/data/datasources/profile_data_source_impl.dart';
import 'package:fares/features/profile/data/repositories/profile_repo.dart';
import 'package:fares/features/profile/presentation/cubit/profile_cubit.dart';

Future<void> initProfileDi() async {
  getIt.registerLazySingleton<ProfileDataSource>(
    () => ProfileDataSourceImpl(apiService: getIt()),
  );

  getIt.registerLazySingleton(() => ProfileRepo(dataSource: getIt()));

  getIt.registerFactory(() => ProfileCubit(getIt(), getIt()));
}
