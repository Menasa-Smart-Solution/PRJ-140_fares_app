part of '../../feature_imports.dart';

class TrackOrderView extends StatelessWidget {
  const TrackOrderView({super.key, required this.parcel});
  final ParcelModel parcel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OrderOperationCubit>(),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: TrackOrderViewBody(
          parcel: parcel,
        ).withPadding(vertical: 20, horizontal: 16),
      ),
    );
  }

  CustomAppBar _buildAppBar() {
    return CustomAppBar(
      title: LocaleKeys.trackOrder.tr(),
      actions: [OrderMenu(parcel: parcel)],
    );
  }
}
