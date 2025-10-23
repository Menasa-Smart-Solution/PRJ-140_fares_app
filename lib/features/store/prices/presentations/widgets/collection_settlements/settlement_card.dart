part of '../../../feature_imports.dart';

class SettlementCard extends StatelessWidget {
  final ReceiptModel receiptModel;

  const SettlementCard({super.key, required this.receiptModel});

  @override
  Widget build(BuildContext context) {
    final totalPrice =
        int.parse(receiptModel.totalPrice) -
        (receiptModel.withdrawalTransaction != null &&
                receiptModel.withdrawalTransaction!.isNotEmpty
            ? int.parse(receiptModel.withdrawalTransaction!)
            : 0);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          context.pushNamed(
            Routes.financialSettlementRoute,
            arguments: receiptModel.id,
          );
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
                reference: receiptModel.id.toString(),
                date: DateFormat(
                  'yyyy-MM-dd',
                ).format(DateTime.parse(receiptModel.createdAt.toString())),
                parcels: receiptModel.parcelsCount,
                hasDiscount:
                    receiptModel.withdrawalTransaction != null &&
                    receiptModel.withdrawalTransaction!.isNotEmpty,
              ),

              const SizedBox(height: 12),
              const Divider(height: 1, color: AppColors.grey200),
              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: ValueColumn(
                      label: LocaleKeys.total.tr(),
                      value: receiptModel.totalPrice,
                      valueColor: AppColors.primaryColor,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ValueColumn(
                      label: LocaleKeys.discount.tr(),
                      value:
                          receiptModel.withdrawalTransaction != null &&
                              receiptModel.withdrawalTransaction!.isNotEmpty
                          ? receiptModel.withdrawalTransaction!
                          : ' 0.0',
                      valueColor: AppColors.tertiaryColor,
                      isDiscount: true,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ValueColumn(
                      label: LocaleKeys.net.tr(),
                      value: totalPrice.toString(),
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
