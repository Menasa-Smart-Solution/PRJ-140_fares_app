part of '../widgets.dart';

class SearchBlocBuilder extends StatefulWidget {
  const SearchBlocBuilder({super.key, required this.searchController});
  final TextEditingController
  searchController; // Controller for the search input
  @override
  State<SearchBlocBuilder> createState() => _SearchBlocBuilderState();
}

class _SearchBlocBuilderState extends State<SearchBlocBuilder> {
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
            return Expanded(
              child: buildWidget(
                CustomErrorWidget(
                  message: state.errorMessage!,
                  onPressed: () {
                    context.read<OrdersCubit>().getOrders(
                      isRefresh: true,
                      isSearch: true,
                      id: widget.searchController.text.isEmpty
                          ? null
                          : widget.searchController.text,
                    );
                  },
                ),
                context,
              ),
            );
          case StateType.empty:
            return Expanded(
              child: buildWidget(
                const CustomEmptyWidget(message: 'لا توجد شحنات بعد 👋'),
                context,
              ),
            );
          case StateType.noInternet:
            return Expanded(
              child: buildWidget(
                InternetConnectionWidget(
                  onPressed: () {
                    context.read<OrdersCubit>().getOrders(
                      isRefresh: true,
                      isSearch: true,
                      id: widget.searchController.text.isEmpty
                          ? null
                          : widget.searchController.text,
                    );
                  },
                ),
                context,
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
