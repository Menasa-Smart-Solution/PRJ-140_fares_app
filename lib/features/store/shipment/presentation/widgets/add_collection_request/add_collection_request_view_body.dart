part of '../../../feature_imports.dart';

class AddCollectionRequestViewBody extends StatelessWidget {
  const AddCollectionRequestViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
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

                  // phone
                  AppTextFormField(
                    hintText: LocaleKeys.phoneHint.tr(),
                    showLabel: true,
                    title: LocaleKeys.phone.tr(),
                    radius: 10,
                    validator: (v) {},
                  ),

                  verticalSpace(12),

                  // address
                  AppTextFormField(
                    hintText: LocaleKeys.storeLocationHint.tr(),
                    showLabel: true,
                    title: LocaleKeys.storeLocation.tr(),
                    radius: 10,
                    validator: (v) {},
                  ),

                  verticalSpace(12),

                  const CollectionRequestOptions(),

                  verticalSpace(12),

                  AppTextFormField(
                    hintText: LocaleKeys.additionalNote.tr(),
                    showLabel: true,
                    title: LocaleKeys.additionalNote.tr(),
                    radius: 10,
                    validator: (v) {},
                  ),

                  verticalSpace(18),

                  AppTextButton(
                    onPressed: () {},
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
    );
  }
}
