part of '../../../feature_imports.dart';

class ShippingStatusDropdown extends StatefulWidget {
  const ShippingStatusDropdown({super.key});

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
            onChanged: (value) {},
            hint: Text(
              LocaleKeys.shippingStatus.tr(),
              style: AppTextStyles.semiBold14.copyWith(color: Colors.white),
            ),
          ),
        ).withPadding(bottom: 40),
      ),
    );
  }
}
