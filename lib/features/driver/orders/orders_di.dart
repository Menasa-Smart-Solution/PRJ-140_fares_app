import 'package:fares/core/di/dependency_injection.dart';
import 'package:fares/features/driver/orders/data/datasources/orders_data_source.dart';
import 'package:fares/features/driver/orders/data/datasources/orders_data_source_impl.dart';
import 'package:fares/features/driver/orders/data/repositories/orders_repo.dart';
import 'package:fares/features/driver/orders/presentation/cubit/call_records/call_records_cubit.dart';
import 'package:fares/features/driver/orders/presentation/cubit/orders/orders_cubit.dart';

Future<void> initOrdersDI() async {
  getIt.registerLazySingleton<OrdersDataSource>(
    () => OrdersDataSourceImpl(apiService: getIt()),
  );

  getIt.registerLazySingleton(() => OrdersRepo(getIt()));

  getIt.registerFactory(() => OrdersCubit(getIt(), getIt()));

  getIt.registerFactory(() => CallRecordsCubit(getIt(), getIt()));
}
