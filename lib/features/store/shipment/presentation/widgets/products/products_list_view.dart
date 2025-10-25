part of '../../../feature_imports.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key, required this.products});
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<CreateParcelsCubit>().getProducts();
      },
      child: ListView.separated(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductItemWidget(product: products[index]);
        },
        separatorBuilder: (context, index) => verticalSpace(8),
      ),
    );
  }
}
