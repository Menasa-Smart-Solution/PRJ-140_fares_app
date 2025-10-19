part of '../../feature_imports.dart';

class FinancialSettlementView extends StatelessWidget {
  const FinancialSettlementView({super.key});

  static const Map<String, dynamic> _settlementData = {
    'code': '15946',
    'totalValue': 20034.0,
    'discount': 0.0,
    'netValue': 20034.0,
    'createdAt': '2025-10-13',
  };

  static const List<Map<String, dynamic>> _shipmentsData = [
    {
      'id': '125415',
      'title': 'مسفوري و كابتشينو 3 - زليتن',
      'amount': 290.0,
      'phoneNumber': '0930087827',
    },
    {
      'id': '156553',
      'title': 'مرتجعات - طرابلس المركز',
      'amount': 0.0,
      'phoneNumber': '0914467086',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.financialSettlementData.tr()),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: verticalSpace(16)),
          const SliverToBoxAdapter(
            child: CustomFadeInDown(
              duration: 400,
              child: SettlementInfoCard(settlementData: _settlementData),
            ),
          ),
          SliverToBoxAdapter(child: verticalSpace(24)),
          SliverToBoxAdapter(
            child: CustomFadeInUp(
              duration: 500,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
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
          ),
          SliverToBoxAdapter(child: verticalSpace(16)),
          SliverList.builder(
            itemCount: _shipmentsData.length,
            itemBuilder: (context, index) {
              return CustomFadeInUp(
                duration: 600 + (index * 100),
                child: ShipmentItemCard(
                  shipmentData: _shipmentsData[index],
                  index: index,
                ),
              );
            },
          ),
          SliverToBoxAdapter(child: verticalSpace(24)),
        ],
      ),
    );
  }
}
