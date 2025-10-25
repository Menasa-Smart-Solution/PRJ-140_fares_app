part of '../../../feature_imports.dart';

class CreateParcelsCitiesBlocBuilder extends StatelessWidget {
  const CreateParcelsCitiesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CitiesPriceCubit, CitiesPriceState>(
      builder: (context, state) {
        if (state.getCitiesPricesState.isSuccess) {
          return CustomDropdownSearchList<CityModel>(
            items: state.citiesPrices,
            showLabel: true,
            initialValue: context.read<CreateParcelsCubit>().state.selectedCity,
            title: LocaleKeys.chooseCity.tr(),
            onChanged: (value) {
              context.read<CreateParcelsCubit>().setSelectedCity(value);
            },
            validator: (value) {
              if (value == null) {
                return LocaleKeys.fieldRequired.tr();
              }
              return null;
            },
            itemAsString: (item) =>
                '${item.name} - ${item.price} ${LocaleKeys.currency.tr()}',
            hintText: LocaleKeys.chooseCityHint.tr(),
            radius: 10,
            backgroundColor: AppColors.textFormFieldBg,
          );
        } else {
          return AppTextFormField(
            hintText: LocaleKeys.chooseCityHint.tr(),
            validator: (value) {},
            showLabel: true,
            readOnly: true,
            radius: 10,
            suffixIcon: const Icon(Icons.keyboard_arrow_down),
            title: LocaleKeys.chooseCity.tr(),
          );
        }
      },
    );
  }
}
