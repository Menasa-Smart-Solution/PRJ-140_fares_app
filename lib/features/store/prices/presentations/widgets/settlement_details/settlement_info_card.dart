part of '../../../feature_imports.dart';

class SettlementInfoCard extends StatelessWidget {
  final ReceiptModel receiptModel;

  const SettlementInfoCard({super.key, required this.receiptModel});

  @override
  Widget build(BuildContext context) {
    final totalPrice =
        int.parse(receiptModel.totalPrice) -
        (receiptModel.withdrawalTransaction != null &&
                receiptModel.withdrawalTransaction!.isNotEmpty
            ? int.parse(receiptModel.withdrawalTransaction!)
            : 0);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: AppColors.grey200,
            blurRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.pastelGreen,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.info_outline,
                  color: AppColors.primaryColor,
                  size: 24,
                ),
                horizontalSpace(12),
                Text(
                  LocaleKeys.settlementData.tr(),
                  style: AppTextStyles.bold16.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          verticalSpace(20),
          _buildInfoRow(
            label: LocaleKeys.code.tr(),
            value: receiptModel.id.toString(),
            valueColor: AppColors.primaryColor,
            valueStyle: AppTextStyles.bold16,
          ),
          verticalSpace(16),
          const Divider(color: AppColors.textFormBorderColor, height: 1),
          verticalSpace(16),
          _buildInfoRow(
            label: LocaleKeys.totalValue.tr(),
            value: '${receiptModel.totalPrice} ${LocaleKeys.currency.tr()}',
            valueColor: AppColors.primaryColor,
            valueStyle: AppTextStyles.bold16,
          ),
          verticalSpace(16),
          const Divider(color: AppColors.textFormBorderColor, height: 1),
          verticalSpace(16),
          _buildInfoRow(
            label: LocaleKeys.discount.tr(),
            value:
                '${receiptModel.withdrawalTransaction} ${LocaleKeys.currency.tr()}',
            valueColor: Colors.red,
            valueStyle: AppTextStyles.bold16,
          ),
          verticalSpace(16),
          const Divider(color: AppColors.textFormBorderColor, height: 1),
          verticalSpace(16),
          _buildInfoRow(
            label: LocaleKeys.netValue.tr(),
            value: '$totalPrice ${LocaleKeys.currency.tr()}',
            valueColor: AppColors.lightPrimaryColor,
            valueStyle: AppTextStyles.bold16,
          ),
          verticalSpace(16),
          const Divider(color: AppColors.textFormBorderColor, height: 1),
          verticalSpace(16),
          _buildInfoRow(
            label: LocaleKeys.createdAt.tr(),
            value: DateFormat(
              'yyyy-MM-dd',
            ).format(DateTime.parse(receiptModel.createdAt.toString())),
            valueColor: AppColors.grey,
            valueStyle: AppTextStyles.med16,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required String label,
    required String value,
    required Color valueColor,
    required TextStyle valueStyle,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTextStyles.med16.copyWith(color: AppColors.grey)),
        Text(value, style: valueStyle.copyWith(color: valueColor)),
      ],
    );
  }
}
