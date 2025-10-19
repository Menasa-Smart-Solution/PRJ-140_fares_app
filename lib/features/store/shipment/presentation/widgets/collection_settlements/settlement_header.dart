part of '../../../feature_imports.dart';

class SettlementHeader extends StatelessWidget {
  final String reference;
  final String date;
  final int parcels;
  final bool hasDiscount;

  const SettlementHeader({
    super.key,
    required this.reference,
    required this.date,
    required this.parcels,
    required this.hasDiscount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 22,
          backgroundColor: AppColors.pastelGreen,
          child: Icon(
            AppIcons.package,
            color: AppColors.lightPrimaryColor,
            size: 20,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                reference,
                style: AppTextStyles.semiBold16,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),
              Text(
                date,
                style: AppTextStyles.reg12.copyWith(color: AppColors.darkGrey),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.pastelGreen,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            children: [
              const Icon(
                AppIcons.package,
                color: AppColors.primaryColor,
                size: 16,
              ),
              const SizedBox(width: 6),
              Text(
                '${parcels.toString()} ${LocaleKeys.shipment.tr()}',
                style: AppTextStyles.med14.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
