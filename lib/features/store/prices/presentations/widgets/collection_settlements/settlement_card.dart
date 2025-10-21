part of '../../../feature_imports.dart';

class SettlementCard extends StatelessWidget {
  final String date;
  final String reference;
  final int parcels;
  final double total;
  final double discount;
  final double net;

  const SettlementCard({
    super.key,
    required this.date,
    required this.reference,
    required this.parcels,
    required this.total,
    required this.discount,
    required this.net,
  });

  @override
  Widget build(BuildContext context) {
    final hasDiscount = discount > 0;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          context.pushNamed(Routes.financialSettlementRoute);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.greyWhite),
            boxShadow: [
              BoxShadow(
                color: AppColors.darkGrey.withAlpha(30),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SettlementHeader(
                reference: reference,
                date: date,
                parcels: parcels,
                hasDiscount: hasDiscount,
              ),

              const SizedBox(height: 12),
              const Divider(height: 1, color: AppColors.grey200),
              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: ValueColumn(
                      label: LocaleKeys.total.tr(),
                      value: total.toStringAsFixed(2),
                      valueColor: AppColors.primaryColor,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ValueColumn(
                      label: LocaleKeys.discount.tr(),
                      value: discount.toStringAsFixed(2),
                      valueColor: AppColors.tertiaryColor,
                      isDiscount: true,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ValueColumn(
                      label: LocaleKeys.net.tr(),
                      value: net.toStringAsFixed(2),
                      valueColor: AppColors.lightPrimaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
