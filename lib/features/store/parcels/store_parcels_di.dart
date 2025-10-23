import 'package:fares/core/di/dependency_injection.dart';
import 'package:fares/features/store/parcels/data/datasource/store_parcels_datasource.dart';
import 'package:fares/features/store/parcels/data/datasource/store_parcels_datasource_impl.dart';
import 'package:fares/features/store/parcels/data/repos/store_parcels_repo.dart';
import 'package:fares/features/store/parcels/presentation/cubit/store_parcels_cubit.dart';

Future<void> initStoreParcelsDi() async {
  getIt.registerLazySingleton<StoreParcelsDataSource>(
    () => StoreParcelsDatasourceImpl(getIt()),
  );

  getIt.registerLazySingleton(() => StoreParcelsRepo(getIt()));

  getIt.registerFactory(() => StoreParcelsCubit(getIt(), getIt()));
}
