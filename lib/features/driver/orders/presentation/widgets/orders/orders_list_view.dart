part of '../../../feature_imports.dart';

class OrdersListView extends StatelessWidget {
  const OrdersListView({
    super.key,
    required this.parcel,
    this.controller,
    required this.hasMorePages,
  });
  final ScrollController? controller;
  final ParcelsDataModel parcel;
  final bool hasMorePages;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<OrdersCubit>().getOrders(isRefresh: true);
      },
      child: ListView.builder(
        controller: controller,
        itemBuilder: (_, index) {
          if (index == parcel.data?.length) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: CircularProgressIndicator(),
              ),
            );
          }
          return Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(24),

              onTap: () {
                context.pushNamed(
                  Routes.trackOrderRoute,
                  arguments: parcel.data![index],
                );
              },
              child: OrderCardItem(
                parcel: parcel.data![index],
              ).withPadding(bottom: 8),
            ),
          );
        },
        itemCount: parcel.data!.length + (hasMorePages ? 1 : 0),
      ),
    );
  }
}
