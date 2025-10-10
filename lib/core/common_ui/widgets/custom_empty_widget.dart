import 'package:fares/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEmptyWidget extends StatelessWidget {
  const CustomEmptyWidget({
    super.key,
    required this.message,
    required this.imagePath,
  });
  final String message;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath, height: 0.4.sh, fit: BoxFit.fill),
        Text(
          message,
          textAlign: TextAlign.center,
          style: AppTextStyles.semiBold16,
        ),
      ],
    );
  }
}
