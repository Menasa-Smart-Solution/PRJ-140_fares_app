import 'package:easy_localization/easy_localization.dart';
import 'package:fares/core/common_ui/widgets/custom_app_bar.dart';
import 'package:fares/core/helpers/extensions.dart';
import 'package:fares/core/helpers/spacing.dart';
import 'package:fares/core/theme/app_colors.dart';
import 'package:fares/core/theme/app_text_styles.dart';
import 'package:fares/core/utils/app_images.dart';
import 'package:fares/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.message,
    this.imagePath,
    this.showScaffold = false,
    this.onPressed,
  });
  final String message;
  final String? imagePath;
  final VoidCallback? onPressed;
  final bool showScaffold;

  @override
  Widget build(BuildContext context) {
    return showScaffold == true
        ? Scaffold(
            appBar: const CustomAppBar(title: SizedBox()),
            body: _body(context),
          )
        : _body(context);
  }

  Column _body(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          imagePath ?? AppImages.imagesError,
          height: 0.3 * context.height,
          fit: BoxFit.fill,
        ),
        verticalSpace(20),
        Text(
          LocaleKeys.somethingWentWrong.tr(),
          textAlign: TextAlign.center,
          style: AppTextStyles.semiBold16,
        ),
        verticalSpace(10),
        Text(
          message,
          textAlign: TextAlign.center,
          style: AppTextStyles.med16.copyWith(color: AppColors.grey500),
        ),

        if (onPressed != null) ...[
          verticalSpace(30),
          ElevatedButton.icon(
            onPressed: onPressed,
            icon: const Icon(Icons.refresh, color: AppColors.white),
            label: Text(LocaleKeys.retry.tr()),

            style: ElevatedButton.styleFrom(
              minimumSize: const Size(0.8, 50),
              textStyle: AppTextStyles.med16.copyWith(
                fontFamily: AppTextStyles.fontFamily,
              ),
              foregroundColor: AppColors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
