part of '../../../feature_imports.dart';

class ReceiptsBlocBuilder extends StatelessWidget {
  const ReceiptsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReceiptsCubit, ReceiptsState>(
      builder: (context, state) {
        switch (state.getAllReceiptsState) {
          case StateType.loading:
            return const SliverFillRemaining(
              hasScrollBody: false,
              child: Center(child: CustomLoading()),
            );
          case StateType.success:
            return SliverMainAxisGroup(
              slivers: [
                ReceiptsListView(receipts: state.receipts),
                if (state.isLoadingMore)
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Center(child: CustomLoading()),
                    ),
                  ),
              ],
            );
          case StateType.error:
            return SliverFillRemaining(
              hasScrollBody: false,
              child: CustomErrorWidget(
                message: state.errorMessage ?? 'حدث خطأ ما',
                onPressed: () {
                  context.read<CitiesPriceCubit>().getCitiesPrices();
                },
              ),
            );
          case StateType.empty:
            return const SliverFillRemaining(
              hasScrollBody: false,
              child: CustomEmptyWidget(
                message: 'لا توجد تسويات مالية متاحة حالياً..!',
              ),
            );
          case StateType.noInternet:
            return SliverFillRemaining(
              hasScrollBody: false,
              child: InternetConnectionWidget(
                onPressed: () {
                  context.read<CitiesPriceCubit>().getCitiesPrices();
                },
              ),
            );
          default:
            return const SliverToBoxAdapter(child: SizedBox.shrink());
        }
      },
    );
  }
}
