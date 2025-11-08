part of '../../../feature_imports.dart';

class CollectionRequestOptions extends StatelessWidget {
  const CollectionRequestOptions({super.key});

  static const List<String> _options = [
    LocaleKeys.collectShipments,
    LocaleKeys.financialSettlement,
    LocaleKeys.refundShipments,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateStoreCollectCubit, CreateStoreCollectState>(
      buildWhen: (previous, current) =>
          previous.selectedServices != current.selectedServices,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(LocaleKeys.services.tr(), style: AppTextStyles.med14),
            verticalSpace(6),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _options.length,
              itemBuilder: (context, index) {
                final option = _options[index];
                final isSelected = state.selectedServices.contains(option);

                return CheckboxListTile(
                  value: isSelected,
                  onChanged: (v) {
                    context
                        .read<CreateStoreCollectCubit>()
                        .toggleServiceSelection(option);
                  },
                  title: Text(option.tr(), style: AppTextStyles.semiBold14),
                  contentPadding: EdgeInsets.zero,
                  checkboxShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: const BorderSide(
                      color: AppColors.greyWhite,
                      width: 0.5,
                    ),
                  ),
                  dense: true,
                  visualDensity: const VisualDensity(vertical: -4),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
