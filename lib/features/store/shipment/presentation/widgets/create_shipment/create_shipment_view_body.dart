part of '../../../feature_imports.dart';

class CreateShipmentViewBody extends StatefulWidget {
  const CreateShipmentViewBody({super.key});

  @override
  State<CreateShipmentViewBody> createState() => _CreateShipmentViewBodyState();
}

class _CreateShipmentViewBodyState extends State<CreateShipmentViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 12,
        children: [
          verticalSpace(8),
          AppTextFormField(
            hintText: LocaleKeys.enterRecipientName.tr(),
            validator: (value) {},
            showLabel: true,
            radius: 10,
            title: LocaleKeys.recipientName.tr(),
          ),
          AppTextFormField(
            hintText: LocaleKeys.phoneHint.tr(),
            validator: (value) {},
            showLabel: true,
            radius: 10,

            title: LocaleKeys.phone.tr(),
          ),
          AppTextFormField(
            hintText: LocaleKeys.phone2Hint.tr(),
            validator: (value) {},
            showLabel: true,
            radius: 10,
            title: LocaleKeys.phone2.tr(),
          ),

          CustomDropdownSearchList<String>(
            items: const [
              LocaleKeys.nonMeasurable,
              LocaleKeys.measurable,
              LocaleKeys.nonOpenable,
              LocaleKeys.nonReturnable,
              LocaleKeys.exchangeNote,
            ],
            showLabel: true,
            title: LocaleKeys.chooseCity.tr(),
            onChanged: (value) {},
            itemAsString: (item) => item,
            hintText: LocaleKeys.chooseCityHint.tr(),
            radius: 10,
            backgroundColor: AppColors.textFormFieldBg,
          ),
          AppTextFormField(
            hintText: LocaleKeys.enterAddressDetailed.tr(),
            validator: (value) {},
            showLabel: true,
            radius: 10,
            title: LocaleKeys.addressDetailed.tr(),
          ),
          AppTextFormField(
            hintText: LocaleKeys.enterDescription.tr(),
            validator: (value) {},
            showLabel: true,
            radius: 10,
            title: LocaleKeys.description.tr(),
          ),
          Row(
            children: [
              Expanded(
                child: AppTextFormField(
                  hintText: LocaleKeys.enterQuantity.tr(),
                  validator: (value) {},
                  showLabel: true,
                  radius: 10,
                  title: LocaleKeys.quantity.tr(),
                ),
              ),
              horizontalSpace(8),
              Expanded(
                child: AppTextFormField(
                  hintText: LocaleKeys.enterProductPrice.tr(),
                  validator: (value) {},
                  showLabel: true,
                  radius: 10,
                  title: LocaleKeys.productPrice.tr(),
                ),
              ),
            ],
          ),

          CustomDropdownField<String>(
            items: const [' المرسل', ' المستلم'],
            initialValue: ' المرسل',
            onChanged: (value) {},
            itemAsString: (item) => item,
            hint: LocaleKeys.deliveryOnAccount.tr(),
            backgroundColor: AppColors.textFormFieldBg,
            radius: 10,
          ),
          const ChooseShipmentImage(),
          const ShipmentOptions(),
          AppTextButton(onPressed: () {}, text: LocaleKeys.createShipment.tr()),
        ],
      ),
    );
  }
}
