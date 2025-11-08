part of '../../../feature_imports.dart';

class ShipmentOptions extends StatefulWidget {
  const ShipmentOptions({super.key});

  @override
  State<ShipmentOptions> createState() => _ShipmentOptionsState();
}

class _ShipmentOptionsState extends State<ShipmentOptions> {
  final List<String> _options = const [
    LocaleKeys.breakable,
    LocaleKeys.nonMeasurable,
    LocaleKeys.measurable,
    LocaleKeys.nonOpenable,
    LocaleKeys.nonReturnable,
    LocaleKeys.exchangeNote,
    LocaleKeys.partialDelivery,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateParcelsCubit, CreateParcelsState>(
      buildWhen: (previous, current) =>
          current.selectedServices != previous.selectedServices,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.chooseSpecs.tr(),
              style:
                  AppTextStyles.med14, // adjust to med16 or reg14 as you prefer
            ),
            verticalSpace(6),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _options.length,
              itemBuilder: (context, index) {
                final option = _options[index];
                return CheckboxListTile(
                  value: context.read<CreateParcelsCubit>().isServiceSelected(
                    option,
                  ),
                  onChanged: (v) => context
                      .read<CreateParcelsCubit>()
                      .toggleServiceSelection(option),
                  title: Text(option.tr()),
                  controlAffinity: ListTileControlAffinity.leading,
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
