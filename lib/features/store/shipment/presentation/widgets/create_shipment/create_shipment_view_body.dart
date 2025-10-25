part of '../../../feature_imports.dart';

class CreateShipmentViewBody extends StatefulWidget {
  const CreateShipmentViewBody({super.key, required this.products});
  final List<ProductModel> products;

  @override
  State<CreateShipmentViewBody> createState() => _CreateShipmentViewBodyState();
}

class _CreateShipmentViewBodyState extends State<CreateShipmentViewBody> {
  final TextEditingController _recipientNameController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _phone2Controller = TextEditingController();
  final TextEditingController _addressDetailedController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _recipientNameController.dispose();
    _phoneController.dispose();
    _phone2Controller.dispose();
    _addressDetailedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateParcelsCubit>();
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          spacing: 12,
          children: [
            verticalSpace(8),
            AppTextFormField(
              hintText: LocaleKeys.enterRecipientName.tr(),
              controller: _recipientNameController,
              validator: (value) {},
              showLabel: true,
              radius: 10,
              title: LocaleKeys.recipientName.tr(),
            ),
            AppTextFormField(
              hintText: LocaleKeys.phoneHint.tr(),
              controller: _phoneController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return LocaleKeys.fieldRequired.tr();
                } else if (!AppRegex.isPhoneNumberValid(value)) {
                  return LocaleKeys.phoneNumberInvalid.tr();
                }
                return null;
              },
              showLabel: true,
              radius: 10,

              title: LocaleKeys.phone.tr(),
            ),
            AppTextFormField(
              hintText: LocaleKeys.phone2Hint.tr(),
              controller: _phone2Controller,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  if (!AppRegex.isPhoneNumberValid(value)) {
                    return LocaleKeys.phoneNumberInvalid.tr();
                  }
                }
                return null;
              },
              showLabel: true,
              radius: 10,
              title: LocaleKeys.phone2.tr(),
            ),

            const CreateParcelsCitiesBlocBuilder(),
            AppTextFormField(
              hintText: LocaleKeys.enterAddressDetailed.tr(),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return LocaleKeys.fieldRequired.tr();
                }
              },
              controller: _addressDetailedController,
              showLabel: true,
              radius: 10,
              title: LocaleKeys.addressDetailed.tr(),
            ),
            const CreateParcelsProducts(),

            AppTextFormField(
              hintText: LocaleKeys.enterDescription.tr(),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return LocaleKeys.fieldRequired.tr();
                }
              },
              controller: cubit.descriptionController,
              showLabel: true,
              radius: 10,
              title: LocaleKeys.description.tr(),
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: AppTextFormField(
                    hintText: LocaleKeys.enterQuantity.tr(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return LocaleKeys.fieldRequired.tr();
                      }
                    },
                    controller: cubit.quantityController,
                    showLabel: true,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    radius: 10,
                    title: LocaleKeys.quantity.tr(),
                  ),
                ),
                horizontalSpace(8),
                Expanded(
                  child: AppTextFormField(
                    hintText: LocaleKeys.enterProductPrice.tr(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return LocaleKeys.fieldRequired.tr();
                      }
                    },
                    showLabel: true,
                    radius: 10,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: cubit.productPriceController,
                    title: LocaleKeys.productPrice.tr(),
                  ),
                ),
              ],
            ),

            CustomDropdownField<String>(
              items: [LocaleKeys.customer.tr(), LocaleKeys.market.tr()],
              initialValue: LocaleKeys.customer.tr(),
              onChanged: (value) {
                final deliveryType = value == LocaleKeys.customer.tr()
                    ? LocaleKeys.customer
                    : LocaleKeys.market;
                context.read<CreateParcelsCubit>().setOnDeliveryType(
                  deliveryType,
                );
              },
              itemAsString: (item) => item,
              hint: LocaleKeys.deliveryOnAccount.tr(),
              backgroundColor: AppColors.textFormFieldBg,
              radius: 10,
            ),
            const ChooseShipmentImage(),
            const ShipmentOptions(),
            AppTextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<CreateParcelsCubit>().createParcels(
                    phone: _phoneController.text,
                    address: _addressDetailedController.text,
                    recipientName: _recipientNameController.text,
                    recipientPhone2: _phone2Controller.text,
                  );
                }
              },
              text: LocaleKeys.createShipment.tr(),
            ),
          ],
        ),
      ),
    );
  }
}
