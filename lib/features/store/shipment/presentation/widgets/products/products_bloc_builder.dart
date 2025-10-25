part of '../../../feature_imports.dart';

class ProductsBlocBuilder extends StatelessWidget {
  const ProductsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateParcelsCubit, CreateParcelsState>(
      builder: (context, state) {
        switch (state.getProductsState) {
          case StateType.loading:
            return Skeletonizer(
              enabled: true,
              child: ProductsListView(
                products: List.generate(
                  10,
                  (index) => ProductModel(
                    id: index,
                    name: 'Product $index',
                    price: (index * 10.0).toString(),
                    qty: index.toString(),
                  ),
                ),
              ),
            );
          case StateType.success:
            return ProductsListView(products: state.products);
          case StateType.error:
            return CustomErrorWidget(
              message: state.errorMessage!,
              onPressed: () {
                context.read<CreateParcelsCubit>().getProducts();
              },
            );
          case StateType.noInternet:
            return InternetConnectionWidget(
              onPressed: () {
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
