part of '../../feature_imports.dart';

class AllOrdersView extends StatelessWidget {
  const AllOrdersView({super.key, required this.status});
  final String status;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OrdersCubit>()..getOrders(status: status),
      child: Scaffold(
        appBar: CustomAppBar(title: LocaleKeys.shippingStatusUnderReview.tr()),
        body: const AllOrdersViewBody().withPadding(
          vertical: 20,
          horizontal: 16,
        ),
      ),
    );
  }
}
