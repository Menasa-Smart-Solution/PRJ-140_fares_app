part of '../../../feature_imports.dart';

class ChooseShipmentImage extends StatelessWidget {
  const ChooseShipmentImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateParcelsCubit, CreateParcelsState>(
      buildWhen: (previous, current) =>
          current.selectedImage != previous.selectedImage,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(LocaleKeys.shipmentImage.tr(), style: AppTextStyles.med16),
            verticalSpace(5),
            GestureDetector(
              onTap: () {
                context.read<CreateParcelsCubit>().setSelectedImage();
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 1,
                child: Container(
                  width: double.infinity,
                  height: 160,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.textFormFieldBg,
                  ),
                  child: Stack(
                    children: [
                      if (state.selectedImage != null) ...[
                        Positioned.fill(
                          child: Image.file(
                            state.selectedImage!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ] else ...[
                        Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.photo_camera_outlined,
                                size: 48,
                                color: AppColors.primaryColor,
                              ),
                              verticalSpace(8),
                              Text(
                                LocaleKeys.tapToAddImage.tr(),
                                style: AppTextStyles.reg14.copyWith(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],

                      // Remove button when image is present
                      if (state.selectedImage != null)
                        Positioned(
                          top: 8,
                          right: 8,
                          child: GestureDetector(
                            onTap: () {
                              // prevent triggering card tap
                              context
                                  .read<CreateParcelsCubit>()
                                  .clearSelectedImage();
                            },
                            child: const CircleAvatar(
                              radius: 14,
                              backgroundColor: Colors.black54,
                              child: Icon(
                                Icons.close,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),

            // Multi-select options list
          ],
        );
      },
    );
  }
}
