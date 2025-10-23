part of '../../../feature_imports.dart';

class FinancialSettlementViewBody extends StatelessWidget {
  const FinancialSettlementViewBody({super.key, required this.receiptModel});
  final ReceiptModel receiptModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: verticalSpace(16)),
        SliverToBoxAdapter(
          child: SettlementInfoCard(receiptModel: receiptModel),
        ),
        SliverToBoxAdapter(child: verticalSpace(24)),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: AppColors.pastelGreen,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const Icon(
                  AppIcons.package,
                  color: AppColors.primaryColor,
                  size: 24,
                ),
                horizontalSpace(12),
                Text(
                  LocaleKeys.shipments.tr(),
                  style: AppTextStyles.semiBold16.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(child: verticalSpace(16)),
        SliverList.builder(
          itemCount: receiptModel.parcels!.length,
          itemBuilder: (context, index) {
            return CustomFadeInUp(
              duration: 600 + (index * 100),
              child: ShipmentItemCard(parcel: receiptModel.parcels![index]),
            );
          },
        ),
        SliverToBoxAdapter(child: verticalSpace(24)),
      ],
    ).withPadding(horizontal: 16, vertical: 20);
  }
}
