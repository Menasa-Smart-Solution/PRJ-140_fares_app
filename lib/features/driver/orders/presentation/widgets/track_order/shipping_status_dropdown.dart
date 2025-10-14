part of '../../../feature_imports.dart';

class ShippingStatusDropdown extends StatefulWidget {
  const ShippingStatusDropdown({super.key, required this.parcel});
  final ParcelModel parcel;

  @override
  State<ShippingStatusDropdown> createState() => _ShippingStatusDropdownState();
}

class _ShippingStatusDropdownState extends State<ShippingStatusDropdown> {
  final List<String> shippingStatusOptions = [
    LocaleKeys.shippingStatusDelivered.tr(),
    LocaleKeys.shippingStatusPartiallyDelivered.tr(),
    LocaleKeys.shippingStatusInTransit.tr(),
    LocaleKeys.shippingStatusUnderReview.tr(),
    LocaleKeys.shippingStatusDeliveryFailed.tr(),
  ];
  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Align(
        alignment: Alignment.bottomCenter,

        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(100),
          ),
          alignment: Alignment.center,
          child: DropdownButton(
            underline: const SizedBox(),
            // isExpanded: true,
            dropdownColor: AppColors.dropDownColor,
            icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.white),
            items: shippingStatusOptions
                .map(
                  (status) => DropdownMenuItem(
                    value: status,
                    child: Text(
                      status,
                      style: AppTextStyles.semiBold14.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {
              final cubit = context.read<OrderOperationCubit>();
              cubit.cancelOrderReasons();

              showModalBottomSheet(
                context: context,
                backgroundColor: AppColors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                builder: (context) => BlocProvider.value(
                  value: cubit,
                  child: _statusTypes(value!, widget.parcel),
                ),
              );
            },
            hint: Text(
              LocaleKeys.shippingStatus.tr(),
              style: AppTextStyles.semiBold14.copyWith(color: Colors.white),
            ),
          ),
        ).withPadding(bottom: 40),
      ),
    );
  }

  Widget _statusTypes(String value, ParcelModel parcel) {
    switch (value) {
      case final text
          when text == LocaleKeys.shippingStatusPartiallyDelivered.tr():
        return PartialShipmentDeliveryBottomSheet(parcel: parcel);
      case final text when text == LocaleKeys.shippingStatusInTransit.tr():
        return PendingShipmentDeliveryBottomSheet(parcel: parcel);
      case final text when text == LocaleKeys.shippingStatusUnderReview.tr():
        return UnderReviewBottomSheet(parcel: parcel);
      case final text when text == LocaleKeys.shippingStatusDeliveryFailed.tr():
        return ShipmentDeliveryFailedBottomSheet(parcel: parcel);
      case final text when text == LocaleKeys.shippingStatusDelivered.tr():
        return ConfirmOrderShippingBottomSheet(parcel: parcel);
      default:
        return const SizedBox();
    }
  }
}
