part of '../../../feature_imports.dart';

class StoreParcelsBlocBuilder extends StatelessWidget {
  const StoreParcelsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreParcelsCubit, StoreParcelsState>(
      builder: (context, state) {
        switch (state.getAllStoreParcelsState) {
          case StateType.loading:
            return const Center(child: CustomLoading());
          case StateType.success:
            return StoreParcelsListView(storeParcels: state.storeParcels);
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
              const CustomEmptyWidget(message: 'لا توجد شحنات متاحة حالياً..!'),
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
