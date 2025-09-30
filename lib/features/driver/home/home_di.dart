import 'package:fares/core/di/dependency_injection.dart';
import 'package:fares/features/driver/home/data/datasources/home_data_source.dart';
import 'package:fares/features/driver/home/data/datasources/home_data_source_impl.dart';
import 'package:fares/features/driver/home/data/repositories/home_repo.dart';
import 'package:fares/features/driver/home/presentation/cubit/home_cubit.dart';

Future<void> initHomeDI() async {
  getIt.registerLazySingleton<HomeDataSource>(
    () => HomeDataSourceImpl(apiService: getIt()),
  );

  getIt.registerLazySingleton(() => HomeRepo(homeDataSource: getIt()));

  getIt.registerFactory(() => HomeCubit(getIt()));
}
