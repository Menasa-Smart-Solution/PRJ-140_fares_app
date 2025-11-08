part of '../../../feature_imports.dart';

class SubCities extends StatelessWidget {
  const SubCities({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateParcelsCubit, CreateParcelsState>(
      buildWhen: (previous, current) =>
          previous.selectedCity != current.selectedCity,
      builder: (context, state) {
        if (state.selectedCity != null &&
            state.selectedCity!.subCities != null &&
            state.selectedCity!.subCities!.isNotEmpty) {
          return CustomDropdownSearchList<SubCitiesModel>(
            items: state.selectedCity!.subCities!,
            showLabel: true,
            initialValue: context
                .read<CreateParcelsCubit>()
                .state
                .selectedSubCity,
            title: LocaleKeys.chooseArea.tr(),
            onChanged: (value) {
              context.read<CreateParcelsCubit>().setSelectedSubCity(value);
            },
            validator: (value) {
              if (value == null) {
                return LocaleKeys.fieldRequired.tr();
              }
              return null;
            },
            itemAsString: (item) =>
                '${item.name} - ${item.price} ${LocaleKeys.currency.tr()}',
            hintText: LocaleKeys.chooseAreaHint.tr(),
            radius: 10,
            backgroundColor: AppColors.textFormFieldBg,
          ).withPadding(bottom: 12);
        } else {
          return const SizedBox(height: 0);
        }
      },
    );
  }
}
