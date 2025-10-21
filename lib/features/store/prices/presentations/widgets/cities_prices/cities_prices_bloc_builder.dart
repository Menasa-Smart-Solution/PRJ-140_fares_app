part of '../../../feature_imports.dart';

class CitiesPricesBlocBuilder extends StatelessWidget {
  const CitiesPricesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CitiesPriceCubit, CitiesPriceState>(
      builder: (context, state) {
        switch (state.getCitiesPricesState) {
          case StateType.loading:
            return const SliverFillRemaining(
              hasScrollBody: false,
              child: Center(child: CustomLoading()),
            );
          case StateType.success:
            return CitiesPricesListView(citiesPrices: state.citiesPrices);

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
              child: CustomEmptyWidget(message: 'لا توجد مدن متاحة حالياً'),
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
            return const SliverToBoxAdapter(child: SizedBox());
        }
      },
    );
  }
}
