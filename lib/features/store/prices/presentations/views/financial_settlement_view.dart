part of '../../feature_imports.dart';

class FinancialSettlementView extends StatelessWidget {
  const FinancialSettlementView({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ReceiptsCubit>()..getReceiptDetails(id),
      child: Scaffold(
        appBar: CustomAppBar(title: LocaleKeys.financialSettlementData.tr()),
        body: ReceiptsDetailsBlocBuilder(id: id),
        // body: CustomScrollView(
        //   slivers: [
        //     SliverToBoxAdapter(child: verticalSpace(16)),
        //     const SliverToBoxAdapter(
        //       child: CustomFadeInDown(
        //         duration: 400,
        //         child: SettlementInfoCard(settlementData: _settlementData),
        //       ),
        //     ),
        //     SliverToBoxAdapter(child: verticalSpace(24)),
        //     SliverToBoxAdapter(
        //       child: CustomFadeInUp(
        //         duration: 500,
        //         child: Container(
        //           padding: const EdgeInsets.symmetric(
        //             horizontal: 20,
        //             vertical: 12,
        //           ),
        //           margin: const EdgeInsets.symmetric(horizontal: 20),
        //           decoration: BoxDecoration(
        //             color: AppColors.pastelGreen,
        //             borderRadius: BorderRadius.circular(16),
        //           ),
        //           child: Row(
        //             children: [
        //               const Icon(
        //                 AppIcons.package,
        //                 color: AppColors.primaryColor,
        //                 size: 24,
        //               ),
        //               horizontalSpace(12),
        //               Text(
        //                 LocaleKeys.shipments.tr(),
        //                 style: AppTextStyles.semiBold16.copyWith(
        //                   color: AppColors.primaryColor,
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ),
        //     SliverToBoxAdapter(child: verticalSpace(16)),
        //     SliverList.builder(
        //       itemCount: _shipmentsData.length,
        //       itemBuilder: (context, index) {
        //         return CustomFadeInUp(
        //           duration: 600 + (index * 100),
        //           child: ShipmentItemCard(
        //             shipmentData: _shipmentsData[index],
        //             index: index,
        //           ),
        //         );
        //       },
        //     ),
        //     SliverToBoxAdapter(child: verticalSpace(24)),
        //   ],
        // ),
      ),
    );
  }
}
