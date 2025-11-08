part of '../../features_imports.dart';

class StoreHomeSearchView extends StatelessWidget {
  const StoreHomeSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<StoreParcelsCubit>(),
      child: Scaffold(
        body: SafeArea(
          child: const StoreHomeSearchBody().withPadding(
            horizontal: 16,
            vertical: 20,
          ),
        ),
      ),
    );
  }
}
