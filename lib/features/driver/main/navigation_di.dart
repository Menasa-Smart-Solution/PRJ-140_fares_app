import 'package:fares/core/di/dependency_injection.dart';
import 'package:fares/features/driver/main/presentation/cubit/navigation_cubit.dart';

Future<void> initNavigationDI() async {
  getIt.registerFactory<DriverMainCubit>(() => DriverMainCubit());
}
