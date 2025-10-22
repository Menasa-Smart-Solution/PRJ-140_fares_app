import 'package:fares/core/di/dependency_injection.dart';
import 'package:fares/features/store/prices/data/datasource/prices_data_source.dart';
import 'package:fares/features/store/prices/data/datasource/prices_data_source_impl.dart';
import 'package:fares/features/store/prices/data/repos/prices_repo.dart';
import 'package:fares/features/store/prices/presentations/cubits/cities_prices/cities_price_cubit.dart';
import 'package:fares/features/store/prices/presentations/cubits/receipts/receipts_cubit.dart';

Future<void> initPricesDi() async {
  getIt.registerLazySingleton<PricesDataSource>(
    () => PricesDataSourceImpl(getIt()),
  );

  getIt.registerLazySingleton(() => PricesRepo(getIt()));

  getIt.registerFactory(() => CitiesPriceCubit(getIt(), getIt()));
  getIt.registerFactory(() => ReceiptsCubit(getIt(), getIt()));
}
