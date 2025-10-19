part of '../../../feature_imports.dart';

class CollectionRequestOptions extends StatefulWidget {
  const CollectionRequestOptions({super.key});

  @override
  State<CollectionRequestOptions> createState() =>
      _CollectionRequestOptionsState();
}

class _CollectionRequestOptionsState extends State<CollectionRequestOptions> {
  final List<String> _options = const [
    LocaleKeys.collectShipments,
    LocaleKeys.financialSettlement,
    LocaleKeys.refundShipments,
  ];

  final Set<String> _selected = {};

  void _toggleSelection(String option, bool? checked) {
    setState(() {
      if (checked == true) {
        _selected.add(option);
      } else {
        _selected.remove(option);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
            return CheckboxListTile(
              value: _selected.contains(option),
              onChanged: (v) => _toggleSelection(option, v),
              title: Text(option.tr(), style: AppTextStyles.semiBold14),
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
