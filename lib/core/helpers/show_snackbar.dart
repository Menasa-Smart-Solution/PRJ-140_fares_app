import 'package:fares/core/helpers/spacing.dart';
import 'package:fares/core/routing/app_router.dart';
import 'package:fares/core/theme/app_colors.dart';
import 'package:fares/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

enum SnackType { success, error, warning }

void showSnackBar({required String message, required SnackType type}) {
  ScaffoldMessenger.of(
    AppRouter.navigatorKey.currentState!.context,
  ).clearSnackBars();
  ScaffoldMessenger.of(
    AppRouter.navigatorKey.currentState!.context,
  ).showSnackBar(
    SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      showCloseIcon: true,
      duration: const Duration(seconds: 1),
      padding: EdgeInsets.zero,
      content: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Icon(
              type == SnackType.success
                  ? Icons.check_circle
                  : type == SnackType.error
                  ? Icons.error_outlined
                  : Icons.info_outline,
              color: Colors.white,
              size: 40,
            ),
            horizontalSpace(10),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    message,
                    style: AppTextStyles.reg16.copyWith(color: AppColors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: type == SnackType.success
          ? AppColors.primaryColor
          : type == SnackType.error
          ? AppColors.red
          : Colors.orange,
      elevation: 3,
    ),
  );
}
