part of '../../../feature_imports.dart';

class AddCollectionRequestViewBody extends StatefulWidget {
  const AddCollectionRequestViewBody({super.key});

  @override
  State<AddCollectionRequestViewBody> createState() =>
      _AddCollectionRequestViewBodyState();
}

class _AddCollectionRequestViewBodyState
    extends State<AddCollectionRequestViewBody> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      fillData();
    });
    super.initState();
  }

  void fillData() async {
    String? phone = await CacheHelper.getSecuredString(PrefsKeys.phone);
    String? address = await CacheHelper.getSecuredString(PrefsKeys.address);
    if (phone != null) {
      phoneController.text = phone;
    }
    if (address != null) {
      addressController.text = address;
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    phoneController.dispose();
    addressController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            verticalSpace(12),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // header pill
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: AppColors.pastelGreen,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  AppIcons.package,
                                  size: 20,
                                  color: AppColors.primaryColor,
                                ),
                                horizontalSpace(8),

                                Text(
                                  LocaleKeys.collectionRequestData.tr(),
                                  style: AppTextStyles.med16.copyWith(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    verticalSpace(18),
                    const AddCollectionBlocListener(),
                    // phone
                    AppTextFormField(
                      hintText: LocaleKeys.phoneHint.tr(),
                      controller: phoneController,
                      showLabel: true,
                      title: LocaleKeys.phone.tr(),
                      radius: 10,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return LocaleKeys.fieldRequired.tr();
                        } else if (!AppRegex.isPhoneNumberValid(value)) {
                          return LocaleKeys.phoneNumberInvalid.tr();
                        }
                      },
                    ),

                    verticalSpace(12),

                    // address
                    AppTextFormField(
                      hintText: LocaleKeys.storeLocationHint.tr(),
                      showLabel: true,
                      controller: addressController,
                      title: LocaleKeys.storeLocation.tr(),
                      radius: 10,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return LocaleKeys.fieldRequired.tr();
                        }
                      },
                    ),

                    verticalSpace(12),
                    AppTextFormField(
                      hintText: LocaleKeys.additionalNote.tr(),
                      showLabel: true,
                      controller: notesController,
                      title: LocaleKeys.additionalNote.tr(),
                      radius: 10,
                      validator: (v) {},
                    ),

                    verticalSpace(18),

                    const CollectionRequestOptions(),

                    verticalSpace(12),

                    AppTextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context
                              .read<CreateStoreCollectCubit>()
                              .createStoreCollects(
                                phone: phoneController.text,
                                address: addressController.text,
                                notes: notesController.text,
                              );
                        }
                      },
                      text: LocaleKeys.saveRequest.tr(),
                      radius: 14,
                      backgroundColor: AppColors.primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ],
                ),
              ),
            ).withPadding(horizontal: 16, vertical: 20),
          ],
        ),
      ),
    );
  }
}
