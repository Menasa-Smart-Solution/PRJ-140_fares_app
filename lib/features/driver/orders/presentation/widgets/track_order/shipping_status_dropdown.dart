part of '../../../feature_imports.dart';

class ShippingStatusDropdown extends StatefulWidget {
  const ShippingStatusDropdown({super.key});

  @override
  State<ShippingStatusDropdown> createState() => _ShippingStatusDropdownState();
}

class _ShippingStatusDropdownState extends State<ShippingStatusDropdown> {
  final List<String> shippingStatusOptions = [
    "تم تسليم الشحنه",
    "تسليم جزء من الشحنه",
    "قيد التسليم",
    "قيد المراجعه",
    "تعذر التسليم للشحنه",
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
            underline: SizedBox(),
            // isExpanded: true,
            dropdownColor: AppColors.dropDownColor,
            icon: Icon(Icons.keyboard_arrow_down, color: AppColors.white),
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
              'حاله الشحنه',
              style: AppTextStyles.semiBold14.copyWith(color: Colors.white),
            ),
          ),
        ).withPadding(bottom: 40),
      ),
    );
  }
}
