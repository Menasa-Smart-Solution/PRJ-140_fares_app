part of '../../feature_imports.dart';

class AllOrdersView extends StatelessWidget {
  const AllOrdersView({super.key, required this.params});
  final AllOrdersParams params;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<OrdersCubit>()..getOrders(status: params.status),
      child: Scaffold(
        appBar: CustomAppBar(
          title: params.title ?? translateStatus(params.status),
        ),
        body: const AllOrdersViewBody().withPadding(
          vertical: 20,
          horizontal: 16,
        ),
      ),
    );
  }
}

class AllOrdersParams {
  final String status;
  final String? title;
  AllOrdersParams({required this.status, this.title});
}
