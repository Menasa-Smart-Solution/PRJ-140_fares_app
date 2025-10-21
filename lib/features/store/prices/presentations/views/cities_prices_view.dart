part of '../../feature_imports.dart';

class CitiesPricesView extends StatelessWidget {
  const CitiesPricesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CitiesPriceCubit>()..getCitiesPrices(),
      child: Scaffold(
        appBar: const CustomAppBar(title: 'أسعار المدن'),
        body: const CitiesPricesViewBody().withPadding(
          vertical: 20,
          horizontal: 16,
        ),
      ),
    );
  }
}
