part of '../../../feature_imports.dart';

class CreateParcelsBlocBuilder extends StatelessWidget {
  const CreateParcelsBlocBuilder({super.key, required this.isDeposit});
  final bool isDeposit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateParcelsCubit, CreateParcelsState>(
      builder: (context, state) {
        switch (state.getProductsState) {
          case StateType.loading:
            return Skeletonizer(
              enabled: true,
              child: CreateShipmentViewBody(
                products: const [],
                isDeposit: isDeposit,
              ),
            );
          case StateType.success:
            return CreateShipmentViewBody(
              products: state.products,
              isDeposit: isDeposit,
            );
          case StateType.error:
            return CustomErrorWidget(
              message: state.errorMessage!,
              onPressed: () {
                context.read<CitiesPriceCubit>().getCitiesPrices();
                context.read<CreateParcelsCubit>().getProducts();
              },
            );
          case StateType.noInternet:
            return InternetConnectionWidget(
              onPressed: () {
                context.read<CitiesPriceCubit>().getCitiesPrices();
                context.read<CreateParcelsCubit>().getProducts();
              },
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
