part of '../../feature_imports.dart';

class OrderQrCodeView extends StatelessWidget {
  const OrderQrCodeView({super.key, required this.isConfirmOrder});
  final bool isConfirmOrder;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OrderOperationCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: isConfirmOrder
              ? LocaleKeys.deliverShipment.tr()
              : LocaleKeys.deliveryFailed.tr(),
        ),
        body: OrderQrCodeViewBody(
          isConfirmOrder: isConfirmOrder,
        ).withPadding(vertical: 20, horizontal: 16),
      ),
    );
  }
}
