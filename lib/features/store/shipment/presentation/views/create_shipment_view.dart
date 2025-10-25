part of '../../feature_imports.dart';

class CreateShipmentView extends StatelessWidget {
  const CreateShipmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<CreateParcelsCubit>()..getProducts(),
        ),
        BlocProvider(
          create: (context) => getIt<CitiesPriceCubit>()..getCitiesPrices(),
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBar(title: LocaleKeys.addShipment.tr()),
        body: const CreateParcelsBlocBuilder().withPadding(
          horizontal: 16,
          vertical: 20,
        ),
      ),
    );
  }
}
