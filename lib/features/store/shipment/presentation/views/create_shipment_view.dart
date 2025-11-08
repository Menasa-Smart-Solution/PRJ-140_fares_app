part of '../../feature_imports.dart';

class CreateShipmentView extends StatelessWidget {
  const CreateShipmentView({super.key, required this.isDeposit});
  final bool isDeposit;

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
        appBar: CustomAppBar(
          title: isDeposit
              ? LocaleKeys.addDeposit.tr()
              : LocaleKeys.addShipment.tr(),
        ),
        body: CreateParcelsBlocBuilder(
          isDeposit: isDeposit,
        ).withPadding(horizontal: 16, vertical: 20),
      ),
    );
  }
}
