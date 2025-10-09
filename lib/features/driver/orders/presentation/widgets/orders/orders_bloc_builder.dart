part of '../../../feature_imports.dart';

class OrdersBlocBuilder extends StatefulWidget {
  const OrdersBlocBuilder({super.key});

  @override
  State<OrdersBlocBuilder> createState() => _OrdersBlocBuilderState();
}

class _OrdersBlocBuilderState extends State<OrdersBlocBuilder> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      final cubit = context.read<OrdersCubit>();
      if (cubit.state.hasMorePages && !cubit.state.isLoadingMore) {
        cubit.loadMoreOrders();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        switch (state.ordersState) {
          case StateType.loading:
            return Expanded(
              child: Skeletonizer(
                enabled: true,
                child: OrdersListView(
                  parcel: ParcelsDataModel.dummy(),
                  hasMorePages: false,
                ),
              ),
            );
          case StateType.success:
            return Expanded(
              child: OrdersListView(
                parcel: state.orders!.data!.parcels!,
                controller: _scrollController,
                hasMorePages: state.hasMorePages,
              ),
            );
          case StateType.error:
            return Center(
              child: Text(state.errorMessage ?? LocaleKeys.unknown.tr()),
            );
          case StateType.empty:
            return const Center(child: Text(" No Data"));
          case StateType.noInternet:
            return const Center(
              child: Text('LocaleKeys.noInternetConnection.tr()'),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
