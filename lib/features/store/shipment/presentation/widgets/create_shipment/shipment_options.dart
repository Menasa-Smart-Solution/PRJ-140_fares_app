part of '../../../feature_imports.dart';

class ShipmentOptions extends StatefulWidget {
  const ShipmentOptions({super.key});

  @override
  State<ShipmentOptions> createState() => _ShipmentOptionsState();
}

class _ShipmentOptionsState extends State<ShipmentOptions> {
  final List<String> _options = const [
    LocaleKeys.nonMeasurable,
    LocaleKeys.measurable,
    LocaleKeys.nonOpenable,
    LocaleKeys.nonReturnable,
    LocaleKeys.exchangeNote,
  ];
  void _toggleSelection(String option, bool? checked) {
    setState(() {
      if (checked == true) {
        _selected.add(option);
      } else {
        _selected.remove(option);
      }
    });
  }

  final Set<String> _selected = {};
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.chooseSpecs.tr(),
          style: AppTextStyles.med14, // adjust to med16 or reg14 as you prefer
        ),
        verticalSpace(6),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _options.length,
          itemBuilder: (context, index) {
            final option = _options[index];
            return CheckboxListTile(
              value: _selected.contains(option),
              onChanged: (v) => _toggleSelection(option, v),
              title: Text(option.tr()),
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
              checkboxShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: const BorderSide(color: AppColors.greyWhite, width: 0.5),
              ),
              dense: true,
              visualDensity: const VisualDensity(vertical: -4),
            );
          },
        ),
      ],
    );
  }
}
