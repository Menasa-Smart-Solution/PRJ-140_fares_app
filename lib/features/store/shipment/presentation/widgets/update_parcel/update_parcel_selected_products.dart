part of '../../../feature_imports.dart';

class UpdateParcelSelectedProducts extends StatelessWidget {
  const UpdateParcelSelectedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateParcelsCubit, UpdateParcelsState>(
      buildWhen: (previous, current) =>
          previous.selectedProducts != current.selectedProducts ||
          previous.qyts != current.qyts,
      builder: (context, state) {
        return state.selectedProducts.isNotEmpty
            ? Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      horizontalSpace(50),
                      Expanded(
                        flex: 2,
                        child: Text('المنتج', style: AppTextStyles.med16),
                      ),
                      Expanded(
                        child: Text('الكمية', style: AppTextStyles.med16),
                      ),
                    ],
                  ),
                  ListView.separated(
                    separatorBuilder: (context, index) =>
                        const VerticalDivider(),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.selectedProducts.length,
                    itemBuilder: (context, index) {
                      final product = state.selectedProducts[index];
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    context
                                        .read<UpdateParcelsCubit>()
                                        .deleteQty(index);
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: AppColors.red,
                                  ),
                                ),
                                Text(product.name, style: AppTextStyles.med14),
                              ],
                            ),
                          ),
                          horizontalSpace(40),
                          SizedBox(
                            width: 80,
                            child: TextField(
                              controller: TextEditingController(
                                text: state.qyts.length > index
                                    ? state.qyts[index].toString()
                                    : '1',
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                final qty = int.tryParse(value) ?? 1;
                                final updatedQtys = List<int>.from(state.qyts);
                                updatedQtys[index] = qty;
                                context.read<UpdateParcelsCubit>().updateQty(
                                  updatedQtys,
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ).withPadding(bottom: 12)
            : const SizedBox(height: 0);
      },
    );
  }
}
