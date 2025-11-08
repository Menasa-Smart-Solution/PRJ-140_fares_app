import 'package:fares/core/di/dependency_injection.dart';
import 'package:fares/features/store/app_info/data/datasource/app_info_datasource.dart';
import 'package:fares/features/store/app_info/data/datasource/app_info_datasource_impl.dart';
import 'package:fares/features/store/app_info/data/repo/app_info_repo.dart';
import 'package:fares/features/store/app_info/presentation/cubit/app_info_cubit.dart';

Future<void> initAppInfoDI() async {
  getIt.registerLazySingleton<AppInfoDatasource>(
    () => AppInfoDatasourceImpl(apiService: getIt()),
  );

  getIt.registerLazySingleton<AppInfoRepo>(
    () => AppInfoRepo(datasource: getIt()),
  );

  getIt.registerFactory<AppInfoCubit>(() => AppInfoCubit(getIt(), getIt()));
}
