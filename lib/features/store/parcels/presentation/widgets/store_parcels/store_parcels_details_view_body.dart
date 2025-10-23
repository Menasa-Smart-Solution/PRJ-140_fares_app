part of '../../../feature_imports.dart';

class StoreParcelsDetailsViewBody extends StatelessWidget {
  const StoreParcelsDetailsViewBody({super.key, required this.storeParcel});
  final StoreParcelModel storeParcel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: verticalSpace(16)),
        SliverToBoxAdapter(
          child: CustomFadeInDown(
            duration: 400,
            child: ParcelInfoSection(storeParcel: storeParcel),
          ),
        ),
        SliverToBoxAdapter(child: verticalSpace(16)),
        SliverToBoxAdapter(
          child: CustomFadeInUp(
            duration: 500,
            child: RecipientInfoSection(storeParcel: storeParcel),
          ),
        ),
        SliverToBoxAdapter(child: verticalSpace(16)),
        SliverToBoxAdapter(
          child: CustomFadeInUp(
            duration: 600,
            child: ParcelTimelineSection(records: storeParcel.records ?? []),
          ),
        ),
        SliverToBoxAdapter(child: verticalSpace(24)),
      ],
    );
  }
}
