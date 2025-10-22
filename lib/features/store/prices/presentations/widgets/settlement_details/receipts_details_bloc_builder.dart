part of '../../../feature_imports.dart';

class ReceiptsDetailsBlocBuilder extends StatelessWidget {
  const ReceiptsDetailsBlocBuilder({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReceiptsCubit, ReceiptsState>(
      builder: (context, state) {
        switch (state.receiptDetailsState) {
          case StateType.loading:
            return const Center(child: CustomLoading());
          case StateType.success:
            return FinancialSettlementViewBody(
              receiptModel: state.receiptDetails!,
            );
          case StateType.error:
            return buildWidget(
              CustomErrorWidget(message: state.errorMessage!),
              context,
            );
          case StateType.empty:
            return buildWidget(
              const CustomEmptyWidget(
                message: 'لا توجد تفاصيل متاحة حالياً..!',
              ),
              context,
            );
          case StateType.noInternet:
            return buildWidget(
              InternetConnectionWidget(
                onPressed: () {
                  context.read<ReceiptsCubit>().getReceiptDetails(id);
                },
              ),
              context,
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
