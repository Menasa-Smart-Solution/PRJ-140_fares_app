part of '../../../feature_imports.dart';

class ShipmentDeliveryFailedBottomSheet extends StatefulWidget {
  const ShipmentDeliveryFailedBottomSheet({super.key, required this.parcel});
  final ParcelModel parcel;

  @override
  State<ShipmentDeliveryFailedBottomSheet> createState() =>
      _ShipmentDeliveryFailedBottomSheetState();
}

class _ShipmentDeliveryFailedBottomSheetState
    extends State<ShipmentDeliveryFailedBottomSheet> {
  final TextEditingController _notesController = TextEditingController();

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  final List<String> statusOptions = [
    "خطأ فى رقم الهاتف",
    "المنتج غير مطابق",
    "خطأ فى العنوان",
    "لم يتم تأكيد الحجز",
    "الهاتف مقفل",
  ];

  String? selectedStatus;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const BottomSheetContainer(),
              verticalSpace(16),
              Text(
                '${LocaleKeys.theDeliveryFailed.tr()}\n #147077',
                style: AppTextStyles.semiBold24,
                textAlign: TextAlign.center,
              ),
              verticalSpace(24),
              DropdownButtonFormField(
                hint: Text(LocaleKeys.selectStatus.tr()),
                initialValue: selectedStatus,
                items: statusOptions
                    .map(
                      (status) =>
                          DropdownMenuItem(value: status, child: Text(status)),
                    )
                    .toList(),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.white,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                  border: _buildBorder(),
                  enabledBorder: _buildBorder(),
                  focusedBorder: _buildBorder(color: AppColors.primaryColor),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.fieldRequired.tr();
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    selectedStatus = value;
                  });
                },
              ),
              // AppTextFormField(
              //   hintText: LocaleKeys.selectStatus.tr(),
              //   backgroundColor: AppColors.white,
              //   suffixIcon: const Icon(Icons.arrow_drop_down),
              //   validator: (value) {},
              // ),
              verticalSpace(8),
              AppTextFormField(
                hintText: LocaleKeys.additionalNote.tr(),
                controller: _notesController,
                backgroundColor: AppColors.white,
                validator: (value) {},
              ),

              verticalSpace(16),
              BottomSheetActions(
                title: LocaleKeys.update.tr(),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.pop();
                    context.read<OrderOperationCubit>().updateOrderStatus(
                      ChangeOrderStatusRequest(
                        ids: [widget.parcel.id!],
                        status: "RewindInProgress",
                        notes: _notesController.text,
                        unableDeliveryTypeId: selectedStatus,
                      ),
                    );
                  }
                },
              ),

              verticalSpace(20),
            ],
          ).withPadding(vertical: 20, horizontal: 16),
        ),
      ),
    );
  }

  OutlineInputBorder _buildBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: const BorderSide(
        color: AppColors.textFormBorderColor,
        width: 1.5,
      ),
    );
  }
}
