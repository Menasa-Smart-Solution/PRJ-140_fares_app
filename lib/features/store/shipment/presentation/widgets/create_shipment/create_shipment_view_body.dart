part of '../../../feature_imports.dart';

class CreateShipmentViewBody extends StatefulWidget {
  const CreateShipmentViewBody({
    super.key,
    required this.products,
    required this.isDeposit,
  });
  final List<ProductModel> products;
  final bool isDeposit;

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
  final TextEditingController _notesController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    _recipientNameController.dispose();
    _phoneController.dispose();
    _phone2Controller.dispose();
    _addressDetailedController.dispose();
    _notesController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateParcelsCubit>();
    return RefreshIndicator(
      onRefresh: () async {
        context.read<CitiesPriceCubit>().getCitiesPrices();
        context.read<CreateParcelsCubit>().getProducts();
      },
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
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
              verticalSpace(12),
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
              verticalSpace(12),

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
              verticalSpace(12),
              const CreateParcelsCitiesBlocBuilder(),
              verticalSpace(12),

              const SubCities(),
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
              verticalSpace(12),

              const CreateParcelsProducts(),
              verticalSpace(12),

              const SelectedProducts(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CreateParcelQuantityTextFormField(),
                  horizontalSpace(8),
                  Expanded(
                    child: AppTextFormField(
                      hintText: LocaleKeys.enterProductPrice.tr(),
                      validator: (value) {
                        // if (value == null || value.isEmpty) {
                        //   return LocaleKeys.fieldRequired.tr();
                        // }
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
              verticalSpace(12),
              AppTextFormField(
                hintText: LocaleKeys.enterDescription.tr(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.fieldRequired.tr();
                  }
                },
                controller: descriptionController,
                showLabel: true,
                radius: 10,
                title: LocaleKeys.description.tr(),
              ),
              verticalSpace(12),

              AppTextFormField(
                hintText: LocaleKeys.notesHint.tr(),
                validator: (value) {},
                controller: _notesController,
                showLabel: true,
                radius: 10,
                title: LocaleKeys.notes.tr(),
              ),
              verticalSpace(12),

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
                label: 'التوصيل علي',
                hint: LocaleKeys.deliveryOnAccount.tr(),
                backgroundColor: AppColors.textFormFieldBg,
                radius: 10,
              ),
              verticalSpace(12),

              if (!widget.isDeposit) ...[
                const ChooseShipmentImage(),
                verticalSpace(12),

                const ShipmentOptions(),
                verticalSpace(12),
              ],

              const CreateParcelsBlocListener(),
              AppTextButton(
                onPressed: () {
                  final cubit = context.read<CreateParcelsCubit>();
                  if (_formKey.currentState!.validate()) {
                    if (widget.isDeposit) {
                      cubit.addDeposit(
                        phone: _phoneController.text,
                        address: _addressDetailedController.text,
                        recipientName: _recipientNameController.text,
                        recipientPhone2: _phone2Controller.text,
                        notes: _notesController.text,
                        description: descriptionController.text,
                      );
                      return;
                    }
                    cubit.createParcels(
                      phone: _phoneController.text,
                      address: _addressDetailedController.text,
                      recipientName: _recipientNameController.text,
                      recipientPhone2: _phone2Controller.text,
                      description: descriptionController.text,
                      notes: _notesController.text,
                    );
                  }
                },
                text: LocaleKeys.createShipment.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
