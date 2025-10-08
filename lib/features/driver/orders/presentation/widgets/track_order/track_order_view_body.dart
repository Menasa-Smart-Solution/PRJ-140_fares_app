part of '../../../feature_imports.dart';

class TrackOrderViewBody extends StatelessWidget {
  const TrackOrderViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: OrderCardItem(parcel: ParcelModel())),
        const ShippingStatusDropdown(),
      ],
    );
  }
}
