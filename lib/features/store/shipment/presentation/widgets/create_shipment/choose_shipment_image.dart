part of '../../../feature_imports.dart';

class ChooseShipmentImage extends StatefulWidget {
  const ChooseShipmentImage({super.key});

  @override
  State<ChooseShipmentImage> createState() => _ChooseShipmentImageState();
}

class _ChooseShipmentImageState extends State<ChooseShipmentImage> {
  File? _pickedImage;

  Future<void> _pickImage() async {
    final ImagePickerService picker = getIt<ImagePickerService>();
    final File? image = await picker.pickImage(type: ImageSourceType.gallery);
    if (!mounted) return;
    if (image != null) {
      setState(() {
        _pickedImage = image;
      });
    }
  }

  void _removeImage() {
    setState(() {
      _pickedImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(LocaleKeys.shipmentImage.tr(), style: AppTextStyles.med16),
        verticalSpace(5),
        GestureDetector(
          onTap: _pickImage,
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
                  if (_pickedImage != null) ...[
                    Positioned.fill(
                      child: Image.file(_pickedImage!, fit: BoxFit.cover),
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
                  if (_pickedImage != null)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: GestureDetector(
                        onTap: () {
                          // prevent triggering card tap
                          _removeImage();
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
  }
}
