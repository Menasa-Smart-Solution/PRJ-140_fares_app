part of '../../feature_imports.dart';

class UpdateParcelView extends StatelessWidget {
  const UpdateParcelView({super.key, required this.parcelId});
  final int parcelId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = getIt<UpdateParcelsCubit>();
        _initializeCubit(cubit);
        return cubit;
      },
      child: Scaffold(
        appBar: CustomAppBar(title: LocaleKeys.editShipment.tr()),
        body: UpdateParcelBlocBuilder(
          parcelId: parcelId,
        ).withPadding(horizontal: 16, vertical: 20),
      ),
    );
  }

  Future<void> _initializeCubit(UpdateParcelsCubit cubit) async {
    // First, load products and cities in parallel
    await Future.wait([cubit.getProducts(), cubit.getCitiesPrices()]);

    // After data is loaded, fetch the parcel (which will auto-fill the form)
    await cubit.getParcel(parcelId);
  }
}
