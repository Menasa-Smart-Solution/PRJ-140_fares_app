part of '../../../feature_imports.dart';

class UpdateParcelQuantityTextFormField extends StatelessWidget {
  const UpdateParcelQuantityTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateParcelsCubit, UpdateParcelsState>(
      buildWhen: (previous, current) =>
          current.selectedProducts != previous.selectedProducts,
      builder: (context, state) {
        final cubit = context.read<UpdateParcelsCubit>();
        return Expanded(
          child: AppTextFormField(
            hintText: LocaleKeys.enterQuantity.tr(),
            validator: (value) {
              if (state.selectedProducts.isEmpty) {
                if (value == null || value.isEmpty) {
                  return LocaleKeys.fieldRequired.tr();
                }
              }
              return null;
            },
            controller: cubit.qtyController,
            showLabel: true,
            readOnly: state.selectedProducts.isNotEmpty,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            radius: 10,
            title: LocaleKeys.quantity.tr(),
          ),
        );
      },
    );
  }
}
