part of '../../../feature_imports.dart';

class CreateParcelsBlocBuilder extends StatelessWidget {
  const CreateParcelsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateParcelsCubit, CreateParcelsState>(
      builder: (context, state) {
        switch (state.getProductsState) {
          case StateType.loading:
            return const Skeletonizer(
              enabled: true,
              child: CreateShipmentViewBody(products: []),
            );
          case StateType.success:
            return CreateShipmentViewBody(products: state.products);
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
