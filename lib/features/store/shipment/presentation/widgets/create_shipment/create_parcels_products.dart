part of '../../../feature_imports.dart';

class CreateParcelsProducts extends StatelessWidget {
  const CreateParcelsProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateParcelsCubit, CreateParcelsState>(
      builder: (context, state) {
        return CustomDropdownSearchList<ProductModel>(
          items: state.products,
          showLabel: true,
          // validator: (value) {
          //   if (value == null) {
          //     return LocaleKeys.fieldRequired.tr();
          //   }
          //   return null;
          // },
          // showRemove: true,
          initialValue: context
              .read<CreateParcelsCubit>()
              .state
              .selectedProduct,
          title: LocaleKeys.chooseProduct.tr(),
          onChanged: (value) {
            context.read<CreateParcelsCubit>().setSelectedProduct(value);
          },
          itemAsString: (item) =>
              '${item.name} - ${item.price} ${LocaleKeys.currency.tr()}',
          hintText: LocaleKeys.productHint.tr(),
          radius: 10,
          backgroundColor: AppColors.textFormFieldBg,
        );
      },
    );
  }
}
