part of '../../../feature_imports.dart';

class OrdersBlocBuilder extends StatelessWidget {
  const OrdersBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        switch (state.ordersState) {
          case StateType.loading:
            return Expanded(
              child: Skeletonizer(
                enabled: true,
                child: OrdersListView(parcel: ParcelsDataModel.dummy()),
              ),
            );
          case StateType.success:
            return Expanded(
              child: OrdersListView(parcel: state.orders!.data!.parcels!),
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
