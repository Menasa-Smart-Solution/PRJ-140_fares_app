part of '../../../feature_imports.dart';

class StoreParcelsDetailsBlocBuilder extends StatelessWidget {
  const StoreParcelsDetailsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreParcelsCubit, StoreParcelsState>(
      buildWhen: (previous, current) =>
          previous.getStoreParcelDetailsState !=
          current.getStoreParcelDetailsState,
      builder: (context, state) {
        switch (state.getStoreParcelDetailsState) {
          case StateType.loading:
            return const Center(child: CustomLoading());
          case StateType.success:
            return StoreParcelsDetailsViewBody(
              storeParcel: state.storeParcelDetails!,
            );
          case StateType.error:
            return buildWidget(
              CustomErrorWidget(
                message: state.errorMessage!,
                onPressed: () {
                  context.read<StoreParcelsCubit>().getStoreParcels();
                },
              ),
              context,
            );
          case StateType.empty:
            return buildWidget(
              const CustomEmptyWidget(message: 'لا توجد شحنة متاحة حالياً..!'),
              context,
            );
          case StateType.noInternet:
            return buildWidget(
              InternetConnectionWidget(
                onPressed: () {
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
