import 'package:fares/core/utils/exports.dart';
import 'package:fares/features/store/home/features_imports.dart';
import 'package:fares/features/store/home/presentation/cubit/store_home/store_home_cubit.dart';

class StoreHomeView extends StatelessWidget {
  const StoreHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<StoreHomeCubit>()..getStoreHome(),
      child: const StoreHomeBlocBuilder(),
    );
  }
}
