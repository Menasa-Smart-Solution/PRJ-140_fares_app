import 'package:fares/core/utils/exports.dart';
import 'package:flutter/material.dart';

class CustomEmptyWidget extends StatelessWidget {
  const CustomEmptyWidget({super.key, required this.message, this.imagePath});
  final String message;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath ?? AppImages.imagesEmpty,
          height: 0.25 * context.height,
          fit: BoxFit.fill,
        ),
        Text(
          message,
          textAlign: TextAlign.center,
          style: AppTextStyles.semiBold16,
        ),
      ],
    );
  }
}
