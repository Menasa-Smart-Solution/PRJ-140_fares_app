part of '../../feature_imports.dart';

class StoreParcelsView extends StatelessWidget {
  const StoreParcelsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<StoreParcelsCubit>()..getStoreParcels(),
      child: Scaffold(
        appBar: const CustomAppBar(title: 'كل الشحنات'),
        body: const StoreParcelsBlocBuilder().withPadding(
          vertical: 20,
          horizontal: 16,
        ),
      ),
    );
  }
}
