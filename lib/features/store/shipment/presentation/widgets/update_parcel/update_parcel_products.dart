part of '../../../feature_imports.dart';

class UpdateParcelProducts extends StatelessWidget {
  const UpdateParcelProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateParcelsCubit, UpdateParcelsState>(
      builder: (context, state) {
        return state.getProductsState.isSuccess
            ? CustomDropdownSearchList<ProductModel>(
                items: state.products,
                showLabel: true,

                // showRemove: true,
                initialValue: context
                    .read<UpdateParcelsCubit>()
                    .state
                    .selectedProduct,
                title: LocaleKeys.chooseProduct.tr(),
                onChanged: (value) {
                  context.read<UpdateParcelsCubit>().setSelectedProduct(value);
                },
                itemAsString: (item) =>
                    '${item.name} - ${item.price} ${LocaleKeys.currency.tr()}',
                hintText: LocaleKeys.productHint.tr(),
                radius: 10,
                backgroundColor: AppColors.textFormFieldBg,
              )
            : AppTextFormField(
                hintText: LocaleKeys.productHint.tr(),
                validator: (value) {},
                showLabel: true,
                readOnly: true,
                radius: 10,
                suffixIcon: const Icon(Icons.keyboard_arrow_down),
                title: LocaleKeys.chooseProduct.tr(),
              );
      },
    );
  }
}
