import 'package:fares/core/di/dependency_injection.dart';
import 'package:fares/features/store/shipment/data/datasources/shipment_data_source.dart';
import 'package:fares/features/store/shipment/data/datasources/shipment_data_source_impl.dart';
import 'package:fares/features/store/shipment/data/repositories/shipment_repo.dart';
import 'package:fares/features/store/shipment/presentation/cubit/collects/create_store_collect_cubit.dart';
import 'package:fares/features/store/shipment/presentation/cubit/create_parcels/create_parcels_cubit.dart';
import 'package:fares/features/store/shipment/presentation/cubit/update_parcles/update_parcels_cubit.dart';

Future<void> initStoreShipmentDI() async {
  getIt.registerLazySingleton<ShipmentDataSource>(
    () => ShipmentDataSourceImpl(getIt()),
  );

  getIt.registerLazySingleton<ShipmentRepo>(() => ShipmentRepo(getIt()));

  getIt.registerFactory<CreateStoreCollectCubit>(
    () => CreateStoreCollectCubit(getIt()),
  );
  getIt.registerFactory<CreateParcelsCubit>(
    () => CreateParcelsCubit(getIt(), getIt(), getIt()),
  );
  getIt.registerFactory<UpdateParcelsCubit>(
    () => UpdateParcelsCubit(getIt(), getIt(), getIt(), getIt(), getIt()),
  );
}
