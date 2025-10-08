part of '../../../feature_imports.dart';

class OrdersListView extends StatelessWidget {
  const OrdersListView({super.key, required this.parcel});
  final ParcelsDataModel parcel;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (_, index) {
          return Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(24),
              highlightColor: AppColors.lightPrimaryColor,
              hoverColor: AppColors.lightPrimaryColor,

              onTap: () {
                context.pushNamed(Routes.trackOrderRoute);
              },
              child: OrderCardItem(
                parcel: parcel.data![index],
              ).withPadding(bottom: 8),
            ),
          );
        },
        itemCount: parcel.data?.length,
      ),
    );
  }
}
