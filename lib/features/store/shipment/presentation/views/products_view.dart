part of '../../feature_imports.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CreateParcelsCubit>()..getProducts(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(title: LocaleKeys.products.tr()),
        body: const ProductsBlocBuilder().withPadding(
          horizontal: 16,
          vertical: 20,
        ),
      ),
    );
  }
}
