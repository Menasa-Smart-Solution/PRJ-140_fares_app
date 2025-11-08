part of '../../../feature_imports.dart';

class StoreParcelsBlocBuilder extends StatelessWidget {
  const StoreParcelsBlocBuilder({
    super.key,
    this.status,
    this.fromSearch = false,
  });
  final String? status;
  final bool fromSearch;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreParcelsCubit, StoreParcelsState>(
      buildWhen: (previous, current) =>
          previous.getAllStoreParcelsState != current.getAllStoreParcelsState ||
          previous.isLoadingMore != current.isLoadingMore,
      builder: (context, state) {
        switch (state.getAllStoreParcelsState) {
          case StateType.loading:
            return Skeletonizer(
              enabled: true,
              child: StoreParcelsListView(
                storeParcels: dummyParcels,
                isLoadingMore: false,
              ),
            );
          case StateType.success:
            return StoreParcelsListView(
              storeParcels: state.storeParcels,
              isLoadingMore: state.isLoadingMore,
              status: status,
            );
          case StateType.error:
            return buildWidget(
              CustomErrorWidget(
                message: state.errorMessage!,
                onPressed: fromSearch
                    ? null
                    : () {
                        context.read<StoreParcelsCubit>().getStoreParcels();
                      },
              ),
              context,
            );
          case StateType.empty:
            return buildWidget(
              const CustomEmptyWidget(message: 'لا توجد شحنات متاحة حالياً..!'),
              context,
            );
          case StateType.noInternet:
            return buildWidget(
              InternetConnectionWidget(
                onPressed: fromSearch
                    ? null
                    : () {
                        context.read<StoreParcelsCubit>().getStoreParcels();
                      },
              ),
              context,
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
