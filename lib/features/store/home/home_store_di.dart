import 'package:fares/core/di/dependency_injection.dart';
import 'package:fares/core/services/internet_service.dart';
import 'package:fares/features/store/home/data/datasource/store_home_datasource.dart';
import 'package:fares/features/store/home/data/datasource/store_home_datasource_impl.dart';
import 'package:fares/features/store/home/data/repo/home_store_repo.dart';
import 'package:fares/features/store/home/presentation/cubit/tickets/tickets_cubit.dart';

Future<void> initHomeStoreDi() async {
  getIt.registerLazySingleton<StoreHomeDataSource>(
    () => StoreHomeDatasourceImpl(getIt()),
  );

  getIt.registerLazySingleton<HomeStoreRepo>(() => HomeStoreRepo(getIt()));

  getIt.registerFactory<TicketsCubit>(
    () => TicketsCubit(getIt<HomeStoreRepo>(), getIt<InternetService>()),
  );
}
