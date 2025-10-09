part of '../../../feature_imports.dart';

class TrackOrderViewBody extends StatelessWidget {
  const TrackOrderViewBody({super.key, required this.parcel});
  final ParcelModel parcel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: OrderCardItem(parcel: parcel)),
        parcel.status == 'FinancialSettlementPending'
            ? const SliverToBoxAdapter(child: SizedBox())
            : const ShippingStatusDropdown(),
      ],
    );
  }
}
